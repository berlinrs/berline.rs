# Notes for creating new berline.rs events

Until April 2025 we used the meetup.com API to retrieve the list of upcoming events and process them into _posts/YYYY-MM-DD-EVENTTYPE.md files.

As of May 2025 this API does not longer exists. Meetup.com introduced a new GraphQL API and put it behind a paywall (required: Meetup Pro License).

As a workaround, for the time being, I implemented a new generator-script, that reads the event notes from a CSV-file, which has to be edited manually (sorry about that).

## The scripts folder

- hackandlearn.tmpl.md
is the Template file for creating the required _posts/.md-files. It has not been modified with the change to the CSV input and will still work with the old API script as well.
- import.rb
I do not know about this file, probably an old version of the generator script. Not used by me.
- next-events.csv
List of the upcoming events. Self-explaining, tab-delimited. Do not remove the header line. All rows will be processed by the script, so enter as many events as you want to create. Remove outdated events (but there will be no error - just a "skipping existing file" warning - if you don't).
- next-hackandlearn_before_2025-04.rb
Archived copy of the now obsolete event generator script, based on the meetup.com API.
- next-hackandlearn.rb
Current generator script.

## Generating events

### Prerequisites
- Ruby
- Nokogiri: sudo gem install nokogiri
- Reverse Markdown: sudo gem install reverse_markdown

### Event list
Remove old events and add new events into /scripts/next-events.csv. Do not remove the header line, columns are tab delimited.

### Run script
From the project root folder run: ```./scripts/next-hackandlearn.rb```

---
Andreas Klostermaier, 2025-05-05