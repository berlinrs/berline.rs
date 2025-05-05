#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# 2025-05-05 Andreas Klostermaier:
# Generate posts-entries for the next n events.
# Since the meetup.com API is now behind a paywall, we fetch
# future events from the manually maintained file "next-events.csv".

require "csv"
require "net/http"
require "time"
require "date"
require "erb"
require "nokogiri"
require "reverse_markdown"
require "json"

#API_URL = URI("https://api.meetup.com/rust-berlin/events")

CWD        = File.expand_path(__dir__)
TEMPLATE   = IO.read(File.join(CWD, "hackandlearn.tmpl.md"))
NEXTEVENTS = File.join(CWD, "next-events.csv")

def slug(title)
  title.downcase.gsub(/\s/, "-").gsub(/[^a-z0-9-]/, "")
end

def extract_from_csv()
  events = []
  CSV.foreach(NEXTEVENTS, headers: true, col_sep: "\t") do |row|
    puts "Processing row: #{row.inspect}" 
    event_date = Date.parse(row['date'])
    event = {
    title: row['title'],
    date: row['date'],
    time: row['time'],
    tz: row['tz'],
    link: row['link'],
    year: event_date.strftime("%Y"),
    month: event_date.strftime("%b"),
    day: event_date.strftime("%d")
    }
    events << event.transform_keys(&:to_sym)
  end
  events
end

def main
  #resp = Net::HTTP.get(API_URL)
  events = extract_from_csv()

  tmpl = ERB.new(TEMPLATE)

  events.each do |event|
    date    = event[:date]
    title   = event[:title]
    outfile = File.join("_posts", "#{date}-#{slug(title)}.md")
    if File.exist?(outfile)
      puts "#{outfile} already exists. Skipping."
      next
    end
    data = tmpl.result_with_hash(event)
    File.open(outfile, "w") { |f| f.write data }
    puts "New meetup written to #{outfile}"
  end
end

if $0 == __FILE__
  main
end
