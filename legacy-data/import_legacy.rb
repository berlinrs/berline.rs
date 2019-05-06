require 'json'
require 'yaml'
require 'pp'
require 'date'
require 'erb'
require 'open-uri'

rust_berlin_meetups = JSON.parse(open("https://api.meetup.com/rust-berlin/events?status=upcoming,past").read)
ots_meetups = JSON.parse(open("https://api.meetup.com/opentechschool-berlin/events?status=upcoming,past").read)

meetups = rust_berlin_meetups + ots_meetups
puts "Found #{meetups.size}"

venues = {}

meetups.each do |m|
  if m["name"] !~ /rust/i
    next
  end

  venue = m["venue"]

  if venue == nil
    venue = { "id" => 20879962 } ## RustBrige @ RustFest. Venue missing.
    m["venue"] = venue
  end

  unless venues[venue["id"]]
    venues[venue["id"]] = venue
  end
end

venue_map = {
  23243142 => "bitcrowd",
  23519732 => "zenmate",
  23086692 => "moz-volta",
  23807973 => "wooga",
  23984300 => "blacklane",
  15686922 => "co-up",
  23739361 => "wire",
  18745662 => "innoq",
  26093192 => "innoq",
  20879962 => "thoughtworks-werkstatt",
  21066952 => "thoughtworks-werkstatt",
  23764597 => "thoughtworks-werkstatt",
  24417129 => "thoughtworks-werkstatt",
  24084563 => "thoughtworks-werkstatt",
  24373245 => "moz-volta",
  24542541 => "moz-volta",
  25429422 => "moz-berlin",
  25407482 => "moz-berlin",
  25856896 => "code-university",
}

locations = YAML.load(File.read "_data/locations.yml")
venues.each do |id, v|
  shortname = venue_map[id]

  if [24373245, 24542541, 25429422].include?(id)
    next # we need to override these and skip
  end

  # Fix missing shortnames when they are Co-Up anyway
  if shortname == nil && (v["name"] =~ /Co-Up/ || v["name"] =~ /co\.up/)
    shortname = venue_map[15686922]
  end

  location = {
    "short" => v["name"],
    "name" => v["name"],
    "street" => v["address_1"],
    "city" => v["city"],
    "osm" => "https://www.openstreetmap.org/?mlat=#{v['lat']}&mlon=#{v['lon']}&zoom=18"
  }

  if shortname == nil
    puts id
    puts location
    exit
  end
  locations[shortname] = location
end

File.open("_data/locations.yml", 'w') do |f|
 f.write(YAML.dump locations)
end

template = File.read('legacy-data/meetup.erb')

def to_slug(title)
  title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
end

meetups.each do |meetup|
  erb = ERB.new(template, 0, "%<>")

  if meetup["name"] !~ /rust/i
    next
  end

  unless meetup["venue"]
    meetup["venue"] = { "id" => 20879962 }
  end

  file_data = erb.result(binding)

  date = Time.at(meetup["time"] / 1000).strftime("%Y-%m-%d")
  filename = "_posts/#{date}-#{to_slug(meetup['name'])}.md"

  File.open(filename, 'w') do |f|
    f.write(file_data)
  end
end
