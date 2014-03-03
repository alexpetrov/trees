require "trees/version"

module Trees

  class Node
    attr_reader :value, :children
    def initialize (value = [], children = [])
      @value = Array(value)
      @children = Array(children)
    end

    def add_child(child)
      @children << child
    end

    def add_value(value)
      @value << value
    end

    def to_string(str = "", func = ->(x) {x.join(' ')})
      as_string(self, str, func)
    end

    private

    def as_string(node, str = "", func = ->(x) {x.join(' ')})
      return str if node == nil
      str << '[' << String(func.call(node.value))
      str << ' ' unless node.children.empty?

      node.children.each do |child|
        str = as_string(child, str, func)
      end

      str << "]"
    end

  end

  class Parser
    def initialize (tree_array)
      @tree_array = tree_array
    end

    def parse
      @current_position = -1
      @depth = 0
      tree = Node.new()
      tree = parse_tree(tree)
      return tree.children[0] if @depth == 0
      throw :braces_disbalanced
    end

    private

    def parse_tree(parent)
      @current_position += 1
      return parent if @current_position > @tree_array.length
      @current = @tree_array[@current_position]
      case @current
      when '['
        @depth += 1
        child = Node.new()
        parent.add_child(parse_tree(child))
      when ']'
        @depth -= 1
        return parent
      else
        parent.add_value(Integer(@current)) unless @current == nil
      end
      parse_tree(parent)
    end
  end

  def Trees.sum_values(node)
    node.to_string("", ->(x){x.inject { |a,b| a + b }})
  end

  def Trees.print_sum_in_nodes(node)
    print = lambda do |y|
      puts ->(x){x.inject { |a,b| a + b }}.call(y)
    end
    node.to_string("", print)
  end

end
