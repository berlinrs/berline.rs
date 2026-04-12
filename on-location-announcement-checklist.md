# Rust Berlin on location 🏳️‍🌈 announcement checklist

## Sequence

- [ ] Copy previous announcement from `_pages/` as new post with next date.
- [ ] Open last announcement on Meetup.com and duplicate, then preview the draft.
- [ ] Copy the Meetup ID from the Meetup.com event URL.
- [ ] In the new post, select the previous meetup announcement's Meetup.com event ID
      and replace all occurrences by the new ID.
- [ ] In the frontmatter, update `title:` and `date:`.
- [ ] Update `location:` if the event does not take place at the default location.
- [ ] Update the _"Planned programme"_ section with plans for the upcoming edition.
- [ ] Update the upcoming meetups list introduction paragraph and shift the list items,
      adding a new item according to the 4-weeks cadence.
- [ ] Update the _"Location"_ and _"Accessibility"_ sections if the event
      does not take place at the default location.
- [ ] Stage and review the changes.
- [ ] Copy modified portions via rich text clipboard into the Meetup.com announcement draft.
- [ ] Publish the Meetup.com announcement, send emails one day later to favor regulars.
- [ ] Commit and push the changes, deploying the new announcement.
- [ ] Post the berlin.rs and Meetup.com links in the Zulip topic.
- [ ] On the next day, set Meetup.com mailing to all 4k group members.

## Checklist

### Front matter

- [ ] `title`: edition number incremented.
- [ ] `date`: date updated; with timezone: `+0100` winter / `+0200` summer.
- [ ] `location`: location identifier updated, if not default.
- [ ] `links`: Meetup.com URL updated.

### Header links (top of post)

- [ ] Meetup.com URL updated.

### RSVP paragraph

- [ ] Meetup.com URL updated.

### Planned programme

- [ ] Content updated with topics for this edition.

### Projected upcoming meetups

- [ ] Date and ordinal updated in _"… is our Nth meeting"_.
- [ ] Current date removed from the upcoming list.
- [ ] A new date appended at the bottom of the list.

### Location

- [ ] Location updated, if not default.

### Accessibility

- [ ] Wheelchair access updated, if location changed.
