# SwCharacters


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sw_characters'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sw_characters

## Usage

The program will load with 6 options.

Typing 1-4 will list the selected items in a numbered format. Type the number of the option you would like, then more information about that item will appear.

Typing 5 will allow you to search through the list of characters using their name. It will display a list format if there are multiple hits to your search, otherwise it will display the character info of the closest match. Please refrain from using any titles like "General" or "Emperor". The character list records their true names (or at least known names) and does not include titles.

Entering exit will exit the program

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mlmccor/sw_characters.
