# fixlines

fixlines — a simple multiple files patch system

## Installation

        shards build --release

## Usage

fixlines is a filter that behave as a reverse of "grep -Hn" filter so

         <<. fixlines
         data/A:3:hello
         data/A:5:world
         data/A:3:hello
         data/A:5:world
         .

is equivalent to

         sed -i 3ihello data/A
         sed -i 5iworld data/A
         sed -i 3ihello data/B
         sed -i 5iworld data/B

it was originaly writen as a vi companion

         :r!grep -N foo *
         [edit, edit, edit ...]
         :%!fixlines

## Contributing

1. Fork it (<https://github.com/eiro/fixlines/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Marc Chantreux](https://github.com/eiro) - creator and maintainer
