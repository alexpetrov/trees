require "trees/version"

module Trees

  class Node
    attr_reader :value, :children
    def initialize (value, children = [])
      @value = Array(value)
      @children = Array(children)
    end

    def add_child(child)
      @children << child
    end
  end

  class Parser
    def initialize (tree_array)
      @tree_array = tree_array
    end

    def parse
      @tree = nil
      @tree = parse_tree(0)
      @tree
    end

    private

    def parse_tree(current_position)
      values = []
      @tree_array[current_position..-1].each_with_index do |current, index|
        case current
        when '['
          parse_tree(index+1)
        when ']'
          return Node.new(values)
        else
          values << current
        end
      end
    end
  end

  def Trees.as_string(node, str = "", func = ->(x) {x.join(' ')})
    return str if node == nil
    str << '[' << String(func.call(node.value))
    str << ' ' unless node.children.empty?

    node.children.each do |child|
      str = as_string(child, str, func)
    end

    str << "]"
  end

  def Trees.sum_values(node)
    as_string(node, "", ->(x){x.inject { |a,b| a + b }})
  end

  def Trees.print_sum_in_nodes(node)
    print = lambda do |y|
      puts ->(x){x.inject { |a,b| a + b }}.call(y)
    end
    as_string(node, "", print)
  end

end
