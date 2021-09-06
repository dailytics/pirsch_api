# Pirsch API Ruby Gem
This is a simple wrapper to read the Pirsch Analytics API with Ruby.
It's based on the [API guide](https://docs.pirsch.io/api-sdks/api/)

## Usage
Add this gem to your Gemfile:

```rb
gem 'pirsch_api'
```

Now you need to initialize a Client with your `client_id` and the `client_secret`.

```rb
client = PirschApi::Client.new(client_id: '<client_id>', client_secret: '<client_secret>') 

# Test if the credentials are valid
client.valid?
=> true
```

You will need a `Domain` as a parameter to all the following methods. This parameter could be either
a `PisrchApi::Domain` instance or a simple String containing the `id` of one domain.

```rb
# Get /domains
client.domains
=> [#<PirschApi::Domain id="0D3a...", user_id="0D3a...", hostname="pirsch.io", subdomain="pirsch", ... >]
domain = c.domains.first
domain.hostname
=> "pirsch.io"
domain.id
=> "0D3a..."
domain.to_s
=> "0D3a..."
```
All the following methods receive a `domain` and an optional `filters` hash as a parameter. You can include any filter defined in the official documentation.

```rb
# Get /statistics/visitors
client.visitors(domain: domain)

# Get /statistics/active
client.active(domain: domain)

# Get /statistics/pages
client.pages(domain: domain)

# Get /statistics/referrers
client.referrers(domain: domain)

# Get /statistics/growth
client.growth(domain: domain)

# Get /statistics/events
client.events(domain: domain)

# Get /statistics/utm/source
client.utm_source(domain: domain)

# Get /statistics/utm/medium
client.utm_medium(domain: domain)

# Get /statistics/utm/campaign
client.utm_campaign(domain: domain)
```

## Examples
```rb

client.visitors(domain: d)
=> [#<PirschApi::Visitor day="2021-08-30T00:00:00Z", visitors=87, views=200, sessions=125, bounces=53, bounce_rate=0.6091954022988506>, #<PirschApi::Visitor day="2021-08-31T00:00:00Z", visitors=77, views=159, sessions=113, bounces=49, bounce_rate=0.6363636363636364>, #<PirschApi::Visitor day="2021-09-01T00:00:00Z", visitors=76, views=161, sessions=110, bounces=48, bounce_rate=0.631578947368421>, #<PirschApi::Visitor day="2021-09-02T00:00:00Z", visitors=79, views=152, sessions=130, bounces=52, bounce_rate=0.6582278481012658>, #<PirschApi::Visitor day="2021-09-03T00:00:00Z", visitors=53, views=109, sessions=68, bounces=26, bounce_rate=0.49056603773584906>, #<PirschApi::Visitor day="2021-09-04T00:00:00Z", visitors=54, views=126, sessions=71, bounces=31, bounce_rate=0.5740740740740741>, #<PirschApi::Visitor day="2021-09-05T00:00:00Z", visitors=116, views=202, sessions=131, bounces=84, bounce_rate=0.7241379310344828>, #<PirschApi::Visitor day="2021-09-06T00:00:00Z", visitors=1, views=1, sessions=1, bounces=1, bounce_rate=1>]

client.visitors(domain: d, filters: { from: '2021-09-01' })
=> [#<PirschApi::Visitor day="2021-09-01T00:00:00Z", visitors=76, views=161, sessions=110, bounces=48, bounce_rate=0.631578947368421>, #<PirschApi::Visitor day="2021-09-02T00:00:00Z", visitors=79, views=152, sessions=130, bounces=52, bounce_rate=0.6582278481012658>, #<PirschApi::Visitor day="2021-09-03T00:00:00Z", visitors=53, views=109, sessions=68, bounces=26, bounce_rate=0.49056603773584906>, #<PirschApi::Visitor day="2021-09-04T00:00:00Z", visitors=54, views=126, sessions=71, bounces=31, bounce_rate=0.5740740740740741>, #<PirschApi::Visitor day="2021-09-05T00:00:00Z", visitors=116, views=202, sessions=131, bounces=84, bounce_rate=0.7241379310344828>, #<PirschApi::Visitor day="2021-09-06T00:00:00Z", visitors=1, views=1, sessions=1, bounces=1, bounce_rate=1>]

client.visitors(domain: d, filters: { from: '2021-09-01' }).first.day
=> "2021-09-01T00:00:00Z"

# Get /statistics/active
client.active(domain: d)
=> #<PirschApi::Active stats=nil, visitors=0>
client.active(domain: d).visitors
=> 0
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
