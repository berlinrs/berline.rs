#!/usr/bin/env ruby
# encoding: utf-8

require "net/http"
require "time"
require "date"
require "erb"
require "nokogiri"
require "reverse_markdown"
require "json"

API_URL = URI("https://api.meetup.com/rust-berlin/events")

CWD = File.expand_path(__dir__)
TEMPLATE = IO.read(File.join(CWD, "hackandlearn.tmpl.md"))

def slug(title)
  title.downcase.gsub(/\s/, "-").gsub(/[^a-z0-9-]/, "")
end

def extract_from_json(resp)
  json = JSON.parse(resp)
  next_events = json[0, 6]

  next_events.map { |event|
    if event["name"] == "Rust Hack and Learn"
      event_date = Date.parse(event["local_date"])

      {
        title: "Rust Hack and Learn",
        date: event["local_date"],
        time: event["local_time"],
        tz: "+0" + (event["utc_offset"] / 36000).to_s,
        link: event["link"],
        year: event_date.strftime("%Y"),
        month: event_date.strftime("%b"),
        day: event_date.strftime("%d"),
      }
    end
  }.compact
end

def main
  resp = Net::HTTP.get(API_URL)
  events = extract_from_json(resp)

  tmpl = ERB.new(TEMPLATE)

  events.each do |event|
    date = event[:date]
    title = event[:title]
    outfile = File.join("_posts", "#{date}-#{slug(title)}.md")
    if File.exist?(outfile)
      puts "#{outfile} already exists. Skipping."
      next
    end
    data = tmpl.result_with_hash(event)
    File.open(outfile, "w") do |f|
      f.write data
    end
    puts "New meetup written to #{outfile}"
  end
end

if $0 == __FILE__
  main
end
