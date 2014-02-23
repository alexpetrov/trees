require_relative 'lib/trees.rb'

puts "Here is the demo of test exercise for Clojure Cource by Alex Ott, Dmitry Bushenko and Nikita Prokopov"
puts "It was made in my current favourite laguage Ruby with TDD and Confident Ruby pattens."
treeArray = ['[', '1', '[', '2', '3', ']', '4 ','[', '5', '[', '6', '7', ']', ']', '[', '8',']',']']
parser = Trees::Parser.new(treeArray)
tree = parser.parse

puts "This is the source tree:"
puts tree.to_string

puts "This is the tree with sum of numbers in each node:"
puts Trees.sum_values(tree)

puts "And here is exactly the required task. Print sum in each node:"
Trees.print_sum_in_nodes(tree)
