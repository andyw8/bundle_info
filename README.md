# bundle_info

When exploring an existing Ruby project, the `Gemfile` or `.gemspec` can be a good place to start. Sometimes there's a few gems you don't recognise. Rather than having to Google for each one individually, just run `bundle_info` to show a short summary of them all.

Works with `Gemfile` or `.gemspec`

## Installation

    $ gem install bundle_info

## Usage

	$ cd some_project
	$ bundle_info

    webby: *Webby* is a fantastic little website management system. It would be called a...
    coderay: Fast and easy syntax highlighting for selected languages, written in Ruby. Co...
    RedCloth: Textile parser for Ruby.
    configuration: description: configuration kicks the ass
    rdiscount: Fast Implementation of Gruber's Markdown in C

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
