require "trees/version"

module Trees

  class Node
    attr_reader :value, :children
    def initialize (value, children = [])
      @value = Array(value)
      @children = Array(children)
    end

    def self.as_string(node, str = "", func = ->(x) {x.join(' ')})
      return str if node == nil
      str << '[' << String(func.call(node.value))
      str << ' ' unless node.children.empty?

      node.children.each do |child|
        str = as_string(child, str, func)
      end

      str << "]"
    end

    def self.sum_values(node)
      as_string(node, "", ->(x){x.inject { |a,b| a + b }})
    end
  end
end
