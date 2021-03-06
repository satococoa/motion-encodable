# motion-encodable

[![Gem Version](https://badge.fury.io/rb/motion-encodable.png)](http://badge.fury.io/rb/motion-encodable)
[![Build Status](https://travis-ci.org/satococoa/motion-encodable.png?branch=master)](https://travis-ci.org/satococoa/motion-encodable)
[![Dependency Status](https://gemnasium.com/satococoa/motion-encodable.png)](https://gemnasium.com/satococoa/motion-encodable)
[![Code Climate](https://codeclimate.com/github/satococoa/motion-encodable.png)](https://codeclimate.com/github/satococoa/motion-encodable)

Implement NSCoding protocol methods with ease for RubyMotion.

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
  include Motion::Encodable
  properties :title, :body
end
```

Now, you can serialize and deserialize your object using NSCoding protocol.

```
entry = Entry.new
entry.title = 'foo'
entry.body = 'bar'

# save to NSUserDefaults
user_defaults = NSUserDefaults.standardUserDefaults
user_defaults[:entry] = entry.to_data

loaded_entry = Entry.load(user_defaults[:entry])
loaded_entry.instance_variable_get('@title') # => "foo"
loaded_entry.instance_variable_get('@body') # => "bar"

# save to file
dir_path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0]
file_path = dir_path + '/entry.dat'
entry.save_to_file(file_path)

loaded_entry = Entry.load(NSData.dataWithContentsOfFile(file_path))
loaded_entry.instance_variable_get('@title') # => "foo"
loaded_entry.instance_variable_get('@body') # => "bar"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
