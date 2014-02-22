# trees/test/tree_test.rb
require_relative 'test_helper'

module Trees

  class TreesTest < Test::Unit::TestCase

    def test_node_class
      node = Node.new([1])
      assert node
    end

    def test_attr_accessors
      node = Node.new(1)
      assert_equal '[1]', node.value.to_s
    end

    def test_children_are_arraified_in_constructor
      node = Node.new(1, Node.new(2))
      assert_equal '[2]', node.children[0].value.to_s
    end

    def test_one_node_as_a_string
      node = Node.new([1, 2])
      assert_equal '[1 2]', node.to_string #Trees::as_string(node)
    end

    def test_node_with_one_child_as_a_string
      node = Node.new([1, 2], Node.new([3]))
      assert_equal '[1 2 [3]]', node.to_string
    end

    def test_add_child
      node = Node.new(1)
      node.add_child(Node.new(2))
      assert_equal '[1 [2]]', node.to_string
    end

    def test_add_value
      node = Node.new(1)
      node.add_value(2)
      assert_equal '[1 2]', node.to_string
    end

    def test_sum_values
      node = Node.new([1, 2], [Node.new([3,2], Node.new(7)), Node.new([1,2])])
      assert_equal '[3 [5 [7]][3]]', Trees::sum_values(node)
    end

    def test_print_sum_values_in_all_nodes
      node = Node.new([1, 2], [Node.new([3,2], Node.new(7)), Node.new([1,2])])
      Trees::print_sum_in_nodes(node)
    end

    def test_parse_trivial_tree
      parser = Parser.new(['[', ']'])
      assert_equal '[]', parser.parse.to_string
    end

    def test_parse_one_node_tree
      parser = Parser.new(['[', '1',']'])
      assert_equal '[1]', parser.parse.to_string
    end

    def test_parse_one_node_with_two_values
      parser = Parser.new(['[', '1', '2', ']'])
      assert_equal '[1 2]', parser.parse.to_string
    end

    def test_parse_two_nodes_tree
      parser = Parser.new(['[', '1', '[', '2', ']', ']'])
      assert_equal '[1 [2]]', parser.parse.to_string
    end

    def test_parse_three_nodes_tree
      parser = Parser.new(['[', '1', '[', '2', ']', '[','3', '4',']', ']'])
      assert_equal '[1 [2][3 4]]', parser.parse.to_string
    end

    def test_throws_error_for_incorrect_input_data
      parser = Parser.new(['[', '1', '[', '2', ']', '[','3', '4',']'])
      assert_throws(:braces_disbalanced) do
        parser.parse
      end
    end

  end

end
