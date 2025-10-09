# Berlin.rs

This is the [rust-meetup-template](http://github.com/rust-community/rust-meetup-template)-based website for <http://berlin.rs>.

## Redeploy without changes

To update the current listed meetup without changes to any files:

```
git commit --allow-empty -m 'Re-deploy'
git push origin main
```

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

- Clone or download the repository
- Make sure you have Ruby 2.2.5 or above installed
- Run `bundle install` in the directory where you cloned the project (if you don't have Bundler installed, install it using `gem install bundler`)
- Run `bundle exec jekyll serve` to get a local preview of your site. It auto-updates every time you edit something
- If you want LiveReload functionality, run `bundle exec jekyll serve --livereload`

## Local development with a Docker container

If you don't have locally available the Ruby stack, you might want to use a Docker container.

Install Docker (if don't have already) [following this guide](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce).

You can run the website with this command (tested on Linux):
``` bash
$ docker run --rm -p 8000:4000 \
    -v $(pwd):/site \
    bretfisher/jekyll-serve
# site available on: http://localhost:8000
```

An more compact option could be to install [docker-compose](https://docs.docker.com/compose/install) and use the [docker compose recipe](https://github.com/berlinrs/berline.rs/blob/master/docker-compose.yml) with a simple:
``` bash
$ docker-compose up
```
