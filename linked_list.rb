require_relative 'node'

class LinkedList
    attr_accessor :head, :tail
    
    def initialize
        # place to start --> head
        @head = nil
        @tail = nil
    end

    def add(value)
        # first check if the linked list is empty --> head == nil
        if @head.nil?
            @head = Node.new(value, nil, nil)
            @tail = Node.new(value, nil, nil)
        else
            # if there is already a head, the linked list is not empty
            # find the last node in our linked list and set the next property of that node to a new node that we are going to create
            last_node = @head
            
            while !last_node.next.nil? # we are not at the end of that list
                # we'll go through the while loop until we find the last node of the list that is set to nil
                last_node = last_node.next
            end

            # we are at the end of the list --> last_node == nil
            last_node.next = Node.new(value, nil, last_node)
            @tail = last_node.next
        end
    end

    def find(value)
        # find a value within a linked list
        node = @head
        
        while !node.nil?
            if node.value == value
                return true
            end
            node = node.next
        end

        false
    end

    def print_all
        current = @head
        index = 1
        
        until current.nil?
            puts "#{index}. #{current.value}"
        
            current = current.next
            index += 1
        end
    end

    # add a method to the beginning of the linked list
    def prepend(value)
        if @head.nil?
            @head = Node.new(value)
        else
            old_head = @head
            @head = Node.new(value, old_head)
        end
    end

    # remove a node from the linked list
    def remove(value)
        return if @head.nil?

        current = @head
        prev_node = nil

        if value == current.value
            @head = current.next
            print_all
            return
        end

        until current.nil?
            if current.value == value
                # get the previous value
                if !prev_node.nil?
                    # set the next value of the previous to this node's next value
                    prev_node.next = current.next 
                    return print_all
                else
                    @head = nil
                end
            end
            prev_node = current
            current = current.next
        end

        print_all
    end

    def remove_duplicates(head)
        return nil if @head.nil?

        current = @head

        until current.nil?
            while current.next && current.value == current.next.value
                current.next = current.next.next
            end
            current = current.next
        end

        return @head
    end
end

linked_list = LinkedList.new
arr = [5,6,7,7,7,8,9]
arr.each { |n| linked_list.add(n) }
linked_list.remove_duplicates(linked_list.head)
linked_list.print_all