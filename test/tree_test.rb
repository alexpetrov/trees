# trees/test/tree_test.rb
require_relative "test_helper"

class TreesTest < Test::Unit::TestCase

  def test_node_class
    node = Trees::Node.new([1])
    assert node
  end

  def test_attr_accessors
    node = Trees::Node.new(1)
    assert_equal "[1]", node.value.to_s
  end

  def test_nodes_are_arraified_in_constructor
    node = Trees::Node.new(1, Trees::Node.new(2))
    assert_equal "[2]", node.nodes[0].value.to_s
  end

end
