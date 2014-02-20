require "trees/version"

module Trees

  class Node
    attr_reader :value, :nodes
    def initialize (value, nodes = [])
      @value = Array(value)
      @nodes = Array(nodes)
    end

    def self.to_string(node, str = "")
      return str if node == nil
      str << '[' << node.value.join(' ')
      str << ' ' unless node.nodes.empty?

      node.nodes.each do |child|
        str = to_string(child, str)
      end

      str << "]"
    end
  end
end
