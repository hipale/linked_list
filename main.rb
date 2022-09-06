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
    @arr == [] ? false : @head.value
  end

  def tail
    @arr == [] || @arr.length == 1 ? false : @tail.value
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

  def insert_at(value, index)
    count = index
    temp_length = @arr.length
    until count == temp_length
      if @arr[temp_length] == nil
        @arr.push(Node.new(@arr[temp_length - 1]).value)
      else
        @arr[temp_length] = @arr[temp_length - 1]
      end
      temp_length -= 1
    end
    @arr[index] = Node.new(value)
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
list.append(5)
puts list.tail



