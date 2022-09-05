class LinkedList
  def initialize(head = nil, tail = nil)
  @head = Node.new(head)
  @tail = Node.new(tail)
  @arr = [@head, @tail]
  end

  def append(value)
    @arr.push(Node.new(value))
    if @head.value == nil
      @head = @arr.first
    else
      @tail = @arr.last
    end
  end

  def prepend(value)
    if @head == nil
      @head = Node.new(value)
      @arr.unshift(@head)
    else 
      @arr.unshift(Node.new(value))
      @head = @arr.first
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
    if index > @arr.length - 1
      return false
    else 
      return @arr[index].value
    end
  end

  def pop
  @arr.delete(@arr.last)
  @tail = @arr.last
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

  def to_s
    new_arr = []
    count = 0
    until count == @arr.length
      new_arr[count] = "(#{@arr[count].value.to_s})"
      count += 1
    end
    return new_arr.join(' -> ')
  end
end

class Node 
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end


list = LinkedList.new(2, 4)
puts list.size
puts list.to_s


