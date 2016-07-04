# zipcode-de

Find german city data by zip code.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zipcode-de'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zipcode-de

## Usage

```ruby
require 'zipcode-de'

# use it directly
z = ZipCode::DE.new
z.load                         # builds memory-backed global index

z.search(:zip, '45289')        # exact zip code search

# use it through ZipCode::DB
ZipCode::DB.for(:de).load
ZipCode::DB.for(:de).search(:zip, '45289')
```

## Roadmap

* Support prefix search
* Support search by name
* Faster indexes

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/timoschilling/zipcode-de.

## Credits

Data source: OpenStreetMap