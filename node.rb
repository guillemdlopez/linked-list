class Node
    # one piece of the linked list
    # usually has data and a pointer to the next node of the list
    attr_accessor :value, :next

    def initialize(value, next_node = nil)
        @value = value
        @next = next_node
    end

    # def to_s
    #     "Node with value: #{@value}"
    # end
end