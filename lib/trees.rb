require "trees/version"

module Trees

  class Node
    attr_reader :value, :children
    def initialize (value, children = [])
      @value = Array(value)
      @children = Array(children)
    end
  end

  class Parser
    def initialize (tree_array)
      @tree_array = tree_array
    end

    def parse
      result = nil
      @tree_array.each do |current|
        case current
          when '['
          when ']'
          else
            result = Node.new(current)
        end
      end
      result
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
