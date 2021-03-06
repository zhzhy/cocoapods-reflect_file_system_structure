# Cocoapods::ReflectFileSystemStructure

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/cocoapods/reflect_file_system_structure`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cocoapods-reflect_file_system_structure'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cocoapods-reflect_file_system_structure

## Usage

Add this line to the beginning of your Podfile:

```ruby
require 'cocoapods/reflect_file_system_structure'
```
And then run:

```
$ pod update
```

the xcode project directory structure will like this:
![After](https://github.com/zhzhy/cocoapods-reflect_file_system_structure/blob/master/resources/After.png)

Before use this ruby patch, the default project directory is this:
![Before](https://github.com/zhzhy/cocoapods-reflect_file_system_structure/blob/master/resources/Before.png)

So, with this patch, the Pod original file system will present in integrated xcode project,
reading and finding your code will be easy.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cocoapods-reflect_file_system_structure. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
