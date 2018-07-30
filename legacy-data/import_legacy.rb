require 'json'
require 'yaml'
require 'pp'
require 'date'
require 'erb'

rust_berlin_meetups = JSON.parse(File.read 'legacy-data/past_meetups_Rust-Berlin.json')["results"]
ots_meetups = JSON.parse(File.read 'legacy-data/past_meetups_OpenTechSchool-Berlin.json')

meetups = rust_berlin_meetups + ots_meetups

venues = {}

meetups.each do |m|
  venue = m["venue"]

  if venue == nil
    m["venue"] = { "id" => 20879962 } ## RustBrige @ RustFest. Venue missing.
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

template = File.read('scripts/meetup.erb')

def to_slug(title)
  title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
end

meetups.each do |meetup|
  erb = ERB.new(template, 0, "%<>")

  unless meetup["venue"]
    meetup["venue"] = { "id" => 20879962 }
  end
  
  puts meetup["venue"]["id"]
  file_data = erb.result(binding)

  date = Time.at(meetup["time"] / 1000).strftime("%Y-%m-%d")
  filename = "_posts/#{date}-#{to_slug(meetup['name'])}.md"


  File.open(filename, 'w') do |f|
    f.write(file_data)
  end
end
