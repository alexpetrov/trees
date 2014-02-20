require "trees/version"

module Trees

  class Node
    attr_reader :value, :children
    def initialize (value, children = [])
      @value = Array(value)
      @children = Array(children)
    end

    def self.as_string(node, str = "")
      return str if node == nil
      str << '[' << node.value.join(' ')
      str << ' ' unless node.children.empty?

      node.children.each do |child|
        str = as_string(child, str)
      end

      str << "]"
    end
  end
end
