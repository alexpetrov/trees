# Trees

This is the test exercise for Clojure Course (clojurecource.by) by Alex Ott, Dmitry Bushenko and Nikita Prokopov.

To see demo of exercise in action run:
    demo.rb

It was made in my current favorite language Ruby with TDD in Emacs (Prelude).

I applied some Confident Ruby (By Avdi Grimm) patterns:

    Receive policies instead of data
    Use build in conversion functions
    Use Array() conversion to array-ify inputs

## Installation

Add this line to your application's Gemfile:

    gem 'trees'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install trees

## Usage

Use Trees::Parser with parse method to parse tree represented by array like this:

treeArray = ['[', '1', '[', '2', '3', ']', '4 ','[', '5', '[', '6', '7', ']', ']', '[', '8',']',']']

parser = Trees::Parser.new(treeArray)

tree = parser.parse

Use method to_string of Node type to represent tree as a string.
You can give a function for to_string method to make some operations on values in every node in the tree.

    node.to_string("", ->(x){x.inject { |a,b| a + b }})

## Contributing

1. Fork it ( http://github.com/<my-github-username>/trees/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
