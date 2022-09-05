class LinkedList
  def initialize(head = nil, tail = nil)
  @head = Node.new(head)
  @tail = Node.new(tail)
  @arr = [@head, @tail]
  end

  def append(value)
    if @head == nil
      @head = Node.new(value)
    else 
      @arr << Node.new(value)
    end
  end

  def prepend(value)
    if @head == nil
      @head = Node.new(value)
    else 
      @arr.unshift(Node.new(value))
      @head = @arr[0]
    end
  end

  def size
    return @arr.length
  end

  def head
    return @head.value
  end

  def tail
    return @tail.value
  end

  def at(index)
    @arr.each_with_index { |elm, inx| if inx == index then return elm.value end}
  end

  def pop
  @arr.delete(@arr.last)
  @tail = @arr.last
  return @tail.value
  end

  def contains?(value)
    @arr.any? {|elm| elm.value == value}
  end

  def find(value)
    count = 0
    until count == @arr.length
      if value == @arr[count].value 
        return count 
      end
      count += 1
    end  
  end
end

class Node 
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end


list = LinkedList.new(2, 5)
list.pop
print list.find(5)
