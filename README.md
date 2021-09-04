# Pirsch API Ruby Gem
This is a simple wrapper to read the Pirsch Analytics API with Ruby.
It's based on the [API guide](https://docs.pirsch.io/api-sdks/api/)

## Usage
Add this gem to your Gemfile:
```rb
gem 'pirsch_api'
```
Then you need to initialize a Client with your `client_id` and the `client_secret`.
```rb
c = PirschApi::Client.new('<client_id>', '<client_secret>') 

# Test if the credentials are valid
c.valid?
=> true

# Get a new Access Token
c.token
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dailytics/pirsch_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/dailytics/pirsch_api/blob/main/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PirschApi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/dailytics/pirsch_api/blob/main/CODE_OF_CONDUCT.md).
