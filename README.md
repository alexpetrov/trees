# Trees

This is the test exercise for Clojure Course (clojurecource.by) by Alex Ott, Dmitry Bushenko and Nikita Prokopov.

To see demo of exercise in action run:

``` bash
./demo.sh
```

To run tests:

``` bash
./test.sh
```

It was made in one of my favorite languages - Ruby.
I practice TDD. If you are interested in the example of TDD aproach, please check out commits.
I proudly use Emacs (Prelude) as IDE.

I applied some Confident Ruby (By Avdi Grimm) patterns:

- Receive policies instead of data
- Use build in conversion functions
- Use Array() conversion to array-ify inputs

## Installation

Add this line to your application's Gemfile:

    gem 'trees'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install trees

## Usage

Use Trees::Parser with parse method to parse tree represented by array like this:

``` ruby
treeArray = ['[', '1', '[', '2', '3', ']', '4 ','[', '5', '[', '6', '7', ']', ']', '[', '8',']',']']

parser = Trees::Parser.new(treeArray)

tree = parser.parse
```

Use method to_string of Node type to represent tree as a string.
You can give a function for to_string method to make some operations on values in every node in the tree.

``` ruby
node.to_string("", ->(x){x.inject { |a,b| a + b }})
```

Copyright (c) 2014 Alexander Petrov (a.k.a Lysenko by passport)
