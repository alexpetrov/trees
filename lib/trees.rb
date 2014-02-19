require "trees/version"

module Trees

  class Node
    attr_reader :value, :nodes
    def initialize (value, nodes = [])
      @value = Array(value)
      @nodes = Array(nodes)
    end
  end
end
