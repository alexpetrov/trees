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

    def test_nodes_are_arraified_in_constructor
      node = Node.new(1, Node.new(2))
      assert_equal "[2]", node.nodes[0].value.to_s
    end

    def test_one_node_to_s
      node = Node.new([1, 2])
      assert_equal "[1 2]", Node::to_string(node)
    end

    def test_two_nodes_to_s
      node = Node.new([1, 2], Node.new([3]))
      assert_equal "[1 2 [3]]", Node::to_string(node)
    end

  end
end
