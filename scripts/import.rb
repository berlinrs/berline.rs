#!/usr/bin/env ruby
# encoding: utf-8

require "net/http"
require "time"
require "erb"
require "nokogiri"
require "reverse_markdown"
require "json"

TEMPLATE = <<-TMPL
---
title: "<%= name %>"
date: "<%= time.strftime("%Y-%m-%d %H:%M:%S %z") %>"
categories: meetup
location: <%= venue %>
links:
    "Meetup.com": <%= link %>
talks:
- title: "TBD"
  speaker:
    name: "TBD"
---

<%= description %>
TMPL

def usage
  puts <<-EOF
Usage: #{File.basename $0} [URL]

Import data from a meetup.com event.
Automatically parses metadata (date & location) and the description and creates a new entry.
  EOF
end

def slug(title)
  title.downcase.gsub(/\s/, "-").gsub(/[^a-z0-9-]/, "")
end

def extract_title(doc)
  title = doc.search("title").inner_text
  title
    .sub(/, .+/, "")
    .sub(/ \|.+/, "").strip
end

def extract_description(doc)
  desc = doc.search("div.event-description")
  if desc.size == 0
    return nil
  end
  fulldesc = desc[0].inner_html
  desc = ReverseMarkdown.convert fulldesc
  desc.gsub(/ +$/, "")
end

def extract_location(doc)
  location = doc.search("a.venueDisplay address")
  location = ReverseMarkdown.convert(location.inner_html)
  location.split("\n").first
end

def extract_datetime(doc)
  puts doc.to_html
  time = doc.search("div.eventTimeDisplay")
  time = ReverseMarkdown.convert(time.inner_html)
  time = time.gsub(/ to \d.+/, "")
  Time.parse(time)
end

def extract_from_json(doc)
  json = doc.search("script#__NEXT_DATA__")
  json = JSON.parse(json.inner_text)

  event = json["props"]["pageProps"]["event"]
  title = event["title"]
  date = Time.parse(event["dateTime"])
  location = event["venue"]["name"]
  desc = event["description"]

  [title, date, location, desc]
end

def import_event(html)
  doc = Nokogiri::HTML(html)

  if data = extract_from_json(doc)
    data
  else
    title = extract_title(doc)
    date = extract_datetime(doc)
    location = extract_location(doc)
    desc = extract_description(doc)

    [title, date, location, desc]
  end
end

def main
  if ARGV.size != 1
    usage
    exit 1
  end

  uri = ARGV.shift
  uri = URI(uri)
  if uri.scheme != "https" || uri.host != "www.meetup.com"
    $stderr.puts "meetup.com event URL required."
    usage
    exit 1
  end

  resp = Net::HTTP.get(uri)
  title, datetime, location, desc = import_event(resp)

  date = datetime.strftime("%Y-%m-%d")
  outfile = File.join("_posts", "#{date}-#{slug(title)}.md")

  tmpl = ERB.new(TEMPLATE)
  data = tmpl.result_with_hash({
    name: title,
    time: datetime,
    link: uri,
    venue: (location || "online").downcase,
    description: desc,
  })

  File.open(outfile, "w") do |f|
    f.write data
  end
  puts "New meetup written to #{outfile}"
end

if $0 == __FILE__
  main
end
