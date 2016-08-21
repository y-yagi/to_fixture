# ToFixture

Add `to_fixture` method to Active Record object.

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

```
puts user.to_fixture("label")
# =>
# label:
#   name: to_fixture
#   email: to_fixture@example.com
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

