# HashTraverse

```ruby
{foo: {hoi: 'hei'}, bar: 2}.traverse(:foo, :hoi) # => 'hei'
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hash_traverse'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash_traverse

## Usage

```ruby
t = HashTraverse::Traverser.new(foo: {hoi: 'hei'}, bar: 2)

t.traverse(:foo) # => {hoi: 'hei'}
t.traverse(:foo, :hoi) # => 'hei'

t.traverse(:foo, :poi) # => nil
```

Use monkey patching mode with `require`-ing `hash_traverse/core_ext` if you like to use HashTraverse everywhere.
```ruby
require 'hash_traverse/core_ext'

{foo: {hoi: 'hei'}, bar: 2}.traverse(:foo, :hoi) # => 'hei'
```

## Future plan

```ruby
t = HashTraverse::Traverser.new(foo: {hoi: 'hei'}, bar: 2)

t.traverse(:foo, :poi) { :null } # => :null

t.traverse(:foo, :poi) {|*args| args } # => [[:foo], {hoi: 'hei'}]

t.traverse(:foo, :hoi, :oi) {|*args| args } # => [[:foo, :hoi], 'hei']
```

## Contributing

1. Fork it ( https://github.com/moro/hash_traverse/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
