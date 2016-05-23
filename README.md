# ViaCep

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/via_cep`. To experiment with that code, run `bin/console` for an interactive prompt.

## Status
[![Build Status](https://api.travis-ci.org/marcelobarreto/via_cep.svg?branch=master)](https://travis-ci.org/marcelobarreto/via_cep) [![Code Climate](https://codeclimate.com/github/marcelobarreto/via_cep.svg)](https://codeclimate.com/github/marcelobareto/via_cep) [![Code Climate](https://codeclimate.com/github/marcelobarreto/via_cep/coverage.svg)](https://codeclimate.com/github/marcelobarreto/via_cep)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'via_cep'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install via_cep

## Usage

On terminal you can use via_cep like this:
```ruby
  require 'via_cep'

  address = ViaCep::Address.new('01001-000')
  address = ViaCep::Address.new(01001000)

  address.street # Returns "Praça da Sé"
```

You can use from terminal either

```bash
  $ zipcode 01001-000 01406000
```
It will return 2 address with its information

```bash

01001-000:
  Praça da Sé
  Sé
  São Paulo
  SP

01406000:
  Avenida Nove de Julho
  Jardim Paulista
  São Paulo
  SP
```

And also search for a zipcode by an address

```ruby
search = ViaCep::SearchByAddress.new(state: 'SP', city: 'São Paulo', street: 'Praça da Sé')

search.zipcode # => "01001-000"
```

### Available methods

  zipcode, street, complement, neighborhood, city, state, ibge, gia.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/marcelobarreto/via_cep. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
