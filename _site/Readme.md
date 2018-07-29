# Rust meetup template

This is a [Jekyll](jekyll) template for a Rust-oriented meetup. It's based on the
[rust-cologne](rustcgn) website.

## Setup

To set up your own website, you can either:

- Fork this repository to your meetup org/user account and edit it
- Download a .zip archive of this repository and set it up as a new GitHub repository
- `git clone` the repository, and then change the Git remote to your repository

This website can easily be hosted using [GitHub Pages](ghpages). Simply activate it in your repository
settings to host your meetup site for free. This also works with forks.

If you want to, you can even add a custom domain (for free). The basic method to do this is:

- Add a `CNAME` file to your repository just containing your custom URL
- Configure your domain to point to GitHub pages. [More information here](https://help.github.com/articles/using-a-custom-domain-with-github-pages/)
- It should be live!

## Local development

Sometimes you want to test or modify things locally. Luckily, this is pretty easy, you just have to do the following:

- Clone or download the repository
- Make sure you have Ruby 2.2.5 or above installed
- Run `bundle install` (if you don't have Bundler installed, install it using `gem install bundler`)
- Run `bundle exec jekyll serve` to get a local preview of your site. It auto-updates every time you edit something
- If you want LiveReload functionality, run `bundle exec jekyll serve --livereload`

[jekyll]: https://jekyllrb.com
[rustcgn]: http://rust.cologne
[ghpages]: https://pages.github.com
