# DiggyDiggyHole

This is a 90% joke rubygem. `Hash#dig` is a neat thing, but what if it were extended a little further Struct-like, Hashie-like things? That's what this is. And a reason to name a gem diggy-diggy-hole.

<img src="./diggy-diggy-hole.gif" />
[♪ Diggy Diggy Hole](https://www.youtube.com/watch?v=ytWz0qVvBZ0)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'diggy-diggy-hole'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install diggy-diggy-hole

## Usage

Use this as a monkeypatch:

```ruby
require 'diggy-diggy-hole/monkeypatch'

class A; def initialize; @value = :success; end; end
class B; def initialize; @a = A.new; end; end
class C; def initialize; @b = B.new; end; end
class D; def initialize; @c = C.new; end; end

D.new.dig(:c, :b, :a, :value) #=> :success
```

Or as a refinement:

```ruby
require 'diggy-diggy-hol/refinement'

using DiggyDiggyHole

class A; def initialize; @value = :success; end; end
class B; def initialize; @a = A.new; end; end
class C; def initialize; @b = B.new; end; end
class D; def initialize; @c = C.new; end; end

D.new.dig(:c, :b, :a, :value) #=> :success
```

Preferred usage is as a refinement, because scoped monkeypatches are better than unscoped monkeypatches.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

The spec files are meant to be run separately, because monkeypatching contaminates state so there'd need to be some way to split the runtime.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/saraid/diggy-diggy-hole.
