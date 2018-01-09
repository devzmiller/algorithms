# http://www.geeksforgeeks.org/top-20-linked-list-interview-question/

# CLASS DEFINITION
class LinkedList
  attr_accessor :head

  def initialize(val)
    @head = ListNode.new(val)
  end

  def add_node(val)
    current = @head
    while current.next
      current = current.next
    end
    current.next = ListNode.new(val)
  end

  def add_nodes(values)
    current = @head
    while current.next
      current = current.next
    end
    values.each do |val|
      current.next = ListNode.new(val)
      current = current.next
    end
  end

  def return_list
    nodes = []
    current = @head
    while current
      nodes << current.val
      current = current.next
    end
    nodes.join("->")
  end

  # delete all occurrences of a value
  # def delete(val)
  #   current = @head
  #   while current
  #     if current.val == val
  #
  # end

  # This doesn't work if numbers aren't next to each other. That may have been the original prompt for this method, but better to fix it.
  def delete_duplicates
    current = @head
    next_node = current.next
    node_hash = {current.val => true} # store values in hash to check if they already exist
    while next_node
      if node_hash[next_node.val]
        p current
        p next_node
        current.next = next_node.next
      else
        node_hash[next_node.val] = true
      end
      current = current.next
      next_node = current.next
    end
    self
  end

end

class ListNode
  attr_accessor :val, :next
  def initialize(val)
      @val = val
      @next = nil
  end
end

# METHODS

def partition_ll(head, x)
  current = head

  while current != nil
    if current.next == nil
      tail = current
    end
    current = current.next
  end
  current = head
  original_tail = tail
  prev = nil
  iteration = 1
  new_head = nil
  while current != nil
    puts "iteration: #{iteration}"
    puts "current: #{current.val}"
    temp = current.next
    if current.val >= x
      tail.next = current
      tail = current
      tail.next = nil
      puts "tail: #{tail.val}"
      if current == head
        new_head = temp
      else
        prev.next = temp
      end
    else
      prev = current
    end
    if current == original_tail
      current = nil
    else
      current = temp
    end
    puts "head: #{new_head.val}"
    iteration += 1
  end
  return new_head
end

ll = LinkedList.new(7)
ll.add_nodes([1, 5, 12, 4, 8])
p "starting linked list is: "
p ll
p "partitioned linked list is: "
p partition_ll(ll.head, 6)

def reverse_list(head)
  previous = nil
  current = head
  while current
    next_node = current.next
    current.next = previous
    previous = current
    current = next_node
  end
  previous
end

def find_loop(head)
  slow = head
  fast = head
  while slow && fast && fast.next
    slow = slow.next
    fast = fast.next.next
    if slow == fast
      return true
    end
  end
  false
end

def print_middle(head)
  slow = head
  fast = head
  while fast && fast.next
    slow = slow.next
    fast = fast.next.next
  end
  slow
end

# if current digit = 9, change it to zero, add one to next digit
# if next digit = 10, change it to zero, add one to next digit
def add_one(head)
  reversed = reverse_list(head)
  current = reversed
  carry = 1
  while carry
    current.val += carry
    if current.val == 10
      current.val = 0
      if !current.next
        current.next = ListNode.new(0)
      end
        current = current.next
    else
      carry = nil
    end
  end
  reverse_list(reversed)
end

def nth_from_end(head, n)
  ref_pointer = head
  n_pointer = head
  n.times do
    ref_pointer = ref_pointer.next
  end
  while ref_pointer
    ref_pointer = ref_pointer.next
    n_pointer = n_pointer.next
  end
  n_pointer
end

def del_last_occurrence(head, val)
  prev_last_occurrence = nil
  last_occurrence = nil
  prev = nil
  current = head
  while current
    if current.val == val
      prev_last_occurrence = prev
      last_occurrence = current
    end
    prev = current
    current = current.next
  end
  if prev_last_occurrence
    prev_last_occurrence.next = last_occurrence.next
  else
    head = last_occurrence.next
  end
  head
end

# RUNNER CODE

# Create a list
head = ListNode.new(5)
n2 = ListNode.new(1)
head.next = n2
n3 = ListNode.new(2)
n2.next = n3
n4 = ListNode.new(2)
n3.next = n4
n5 = ListNode.new(3)
n4.next = n5
n6 = ListNode.new(4)
n5.next = n6

head2 = ListNode.new(1)
h2 = ListNode.new(1)
head2.next = h2
h3 = ListNode.new(2)
h2.next = h3
h4 = ListNode.new(2)
h3.next = h4
h5 = ListNode.new(3)
h4.next = h5
h5.next = head2

numlist = ListNode.new(1)
nl2 = ListNode.new(9)
nl3 = ListNode.new(9)
nl4 = ListNode.new(9)
numlist.next = nl2
nl2.next = nl3
nl3.next = nl4

# Test delete_duplicates
# delete_duplicates(head)

# p head

# Test reverse_list
# p reverse_list(head)

# Test find_loop
# p find_loop(head)
# p find_loop(head2)

# Test find middle
# p print_middle(head)

# Test add_one
# p numlist
# p add_one(numlist)

# Test nth from end
# p head
# p nth_from_end(head, 3)

# Test delete last occurrence
# p head
# p del_last_occurrence(head, 4)
