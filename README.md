# SsnObfuscater

[![Build Status](https://travis-ci.org/4rlm/ssn_obfuscater.svg?branch=master)](https://travis-ci.org/4rlm/ssn_obfuscater)
[![Gem Version](https://badge.fury.io/rb/ssn_obfuscater.svg)](https://badge.fury.io/rb/ssn_obfuscater)
[![MIT License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

#### Protects client data by detecting and obfuscating social security numbers (ssn).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ssn_obfuscater'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ssn_obfuscater

## Usage

1) Add your text to a hash with `:text` symbol key, then pass the arguments to `SsnObfuscater.parse(args)` like the example below.  If you don't pass any args, and just run `SsnObfuscater.parse` it will return sample data for testing.

***Note: Social Security Numbers beginning with 000 are not genuine, so this example does not include a real social security number.  It is all fake data generated for testing purposes only.***

```
text = "Dillan Richmond Gorczany, 8/16/1954, 000-12-3456, richmond.gorczany.dillan@jacobs.io, 405.226.5344, 2012 Erling Pass, Eagle Square, East Dwight, PA, 25733, Dynamic Manufacturing, VP of Tech"

result_hash = SsnObfuscater.parse(text: text)
```


2) The returned data will be in hash format like below:

Note the text below is a sample profile of an employee including phone, mailing address, email, DOB, SSN, IP address, and job position.  Imagine this were a much longer text document where the SSN is more difficult to spot with the naked eye.   SsnObfuscater can detect the SSN and render a safe obfuscated version of the text.

You can access the data, like so: `result_hash[:ssn_obf]` and `result_hash[:safe_text]`

```
{:ssn_alert=>true,
 :ssn=>"000-12-3456",
 :ssn_obf=>"XXX-XX-3456",
 :safe_text=>
  "Dillan Richmond Gorczany, 8/16/1954, XXX-XX-3456, richmond.gorczany.dillan@jacobs.io, 405.226.5344, 2012 Erling Pass, Eagle Square, East Dwight, PA, 25733, Dynamic Manufacturing, VP of Tech"
}
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/4rlm/ssn_obfuscater. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SsnObfuscater project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/4rlm/ssn_obfuscater/blob/master/CODE_OF_CONDUCT.md).
