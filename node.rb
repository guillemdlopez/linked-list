class Node
    # one piece of the linked list
    # usually has data and a pointer to the next node of the list
    attr_accessor :value, :next, :prev

    def initialize(value, next_node = nil, prev = nil)
        @value = value
        @next = next_node
        @prev = prev
    end

    # def to_s
    #     "Node with value: #{@value}"
    # end
end