# motion-encodable

[![Build Status](https://travis-ci.org/satococoa/motion-encodable.png?branch=master)](https://travis-ci.org/satococoa/motion-encodable)

Implement NSCoding protocol methods with ease

## Installation

Add this line to your application's Gemfile:

    gem 'motion-encodable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install motion-encodable

## Usage

```
class Entry
  include Encodable
  properties :title
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
