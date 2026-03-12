# Berlin.rs

This is the [rust-meetup-template](http://github.com/rust-community/rust-meetup-template)-based website for <http://berlin.rs>.

## Redeploy without changes

To update the current listed meetup without changes to any files:

1. Open the [workflow page](https://github.com/berlinrs/berline.rs/actions/workflows/jekyll.yml).
2. Click to open the _"Run workflow"_ dropdown, then click the _"Run workflow"_ submit button.

The workflow is also scheduled to run automatically every Thursday night, updating the website's front page to show the next upcoming meetup.

## Creating the next Hack'n'Learn events

As of May 2025 Hack'n'Learn events are NO LONGER sourced from <https://www.meetup.com/rust-berlin/>, as the API was deprecated and the new GrapQL-API is behind a paywall.

Instead new events are sourced from a local CSV file in the scripts folder. Please refer to the README.md file in the scripts folder for full instructions.

## Importing from meetup.com

To import a new event from Meetup.com run the import script:

```
bundle exec scripts/import.rb URL
```

To install the required tooling, run:

```
bundle install --with=development
```

## Local development

Sometimes you want to test or modify things locally. Luckily, this is pretty easy, you just have to do the following:

- Clone or download the repository.
- Make sure you have Ruby 3.4 or above and Bundler 4.0 or above installed.
- Run `bundle install` in the directory where you cloned the project (if you don't have Bundler installed, install it using `gem install bundler`).
- Run `bundle exec jekyll serve` to get a local preview of your site. It auto-updates every time you edit something.
- If you want LiveReload functionality, run `bundle exec jekyll serve --livereload`.

## Local development with a Docker container (recommended)

If you don't have locally available the Ruby stack, you might want to use a Docker container.

Install Docker (if don't have already) [following this guide](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce).

You can run the website with this command (tested on Linux):
```bash
$ docker compose up
# Site available at: http://localhost:4000
```

`docker compose` should come bundled with your `docker` installation. If necessary, however, follow the [installation guide](https://docs.docker.com/compose/install) to install the plugin.
