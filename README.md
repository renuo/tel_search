# TelSearch

[![Gem Version](https://badge.fury.io/rb/tel_search.svg)](https://badge.fury.io/rb/tel_search)

A ruby client for the tel.search.ch api. [Docs](https://tel.search.ch/api/help.en.html)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tel_search'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install tel_search

## Usage

```ruby
client = TelSearch::Client.new(ENV['TEL_API_KEY'])
query = TelSearch::Query.new(where: 'Wallisellen', what: 'Renuo AG', language: :de)

response = client.execute(query)

response.entries.first.name == 'Renuo AG'
```

## Development

Set TEL_KEY in your environment.

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/renuo/tel_search. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/tel_search/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TelSearch project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[renuo]/tel_search/blob/master/CODE_OF_CONDUCT.md).

## Copyright

Copyright 2021-2022 [Renuo AG](https://www.renuo.ch/).
