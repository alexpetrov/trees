# trees/test/tree_test.rb
require_relative "test_helper"

module Trees

  class TreesTest < Test::Unit::TestCase

    def test_node_class
      node = Node.new([1])
      assert node
    end

    def test_attr_accessors
      node = Node.new(1)
      assert_equal "[1]", node.value.to_s
    end

    def test_children_are_arraified_in_constructor
      node = Node.new(1, Node.new(2))
      assert_equal "[2]", node.children[0].value.to_s
    end

    def test_one_node_as_a_string
      node = Node.new([1, 2])
      assert_equal "[1 2]", Node::as_string(node)
    end

    def test_node_with_one_child_as_a_string
      node = Node.new([1, 2], Node.new([3]))
      assert_equal "[1 2 [3]]", Node::as_string(node)
    end

    def test_sum_values
      node = Node.new([1, 2], [Node.new([3,2], Node.new(7)), Node.new([1,2])])
      assert_equal "[3 [5 [7]][3]]", Node::sum_values(node)
    end
  end
end
