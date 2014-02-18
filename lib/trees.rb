require "trees/version"

module Trees

  class Node
    attr_accessor :value, :nodes
    def initialize (value, nodes = [])
      @value = Array(value)
      @nodes = Array(nodes)
    end
  end
end
