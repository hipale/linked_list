class LinkedList
  def initialize(head = nil, tail = nil)
    @head = Node.new(head, tail)
    @tail = Node.new(tail)
    @arr = []
    if @head.value != nil  
      @arr.push(@head)    
      if @tail.value != nil
        @arr.push(@tail)
      end
    elsif @tail.value != nil
      @head = @tail
      @arr.push(@head)
    end
  end

  def append(value) //
    @arr.push(Node.new(value))
    if @head.value == nil
      @head = @arr.first
    else
      @tail = @arr.last
      @head.next_node = @arr[1]
    end
  end

  def prepend(value) //
    if @head == nil
      @head = Node.new(value, @arr[1])
      @arr.unshift(@head)
    else 
      @arr.unshift(Node.new(value, @arr[1]))
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
    index > @arr.length - 1 ? false : @arr[index].value
  end

  def pop
  @arr.delete(@arr.last)
  @tail = @arr.last
  @arr[-2].next_node = nil
  end

  def contains?(value)
    contain = false
    count = 0
    until count == @arr.length
      if @arr[count].value == value 
        contain = true
      end
      count += 1
    end
    return contain
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

  def insert_at(value, index) //
    temp_length = @arr.length
    until index == temp_length
      if @arr[temp_length] == nil
        @arr.push(Node.new(@arr[temp_length - 1].value))
      else
        @arr[temp_length] = @arr[temp_length - 1]
      end
      temp_length -= 1
    end
    @arr[index] = Node.new(value)
  end

  def remove_at(index) //
    left_arr = @arr.slice(0, index + 1)
    right_arr = @arr.slice(index + 1, @arr.length)
    left_arr.pop
    @arr = left_arr.concat(right_arr)
    @head = @arr[0]
    @tail = @arr[-1]
  end
end

class Node 
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end


list = LinkedList.new(nil, 4)
list.append(40)
puts list.head
puts list



