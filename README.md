# ToFixture

Add `to_fixture` method to Active Record object. Result of `to_fixture` can directly use the fixture files.

[![Build Status](https://travis-ci.org/y-yagi/to_fixture.svg?branch=master)](https://travis-ci.org/y-yagi/to_fixture)
[![Gem Version](https://badge.fury.io/rb/to_fixture.svg)](http://badge.fury.io/rb/to_fixture)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'to_fixture'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install to_fixture

## Usage

```ruby
user = User.create!(name: 'to_fixture', email: 'to_fixture@example.com')
puts user.to_fixture
# =>
# users_1:
#   name: to_fixture
#   email: to_fixture@example.com
```

If you want to specify a label, pass the label name as an argument.

```ruby
puts user.to_fixture("label")
# =>
# label:
#   name: to_fixture
#   email: to_fixture@example.com
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

