class ArrayClone
  def initialize
    @array = Array.new
    @length = 0
  end

  def length
    @length = @array.size
    @length
  end

  def add(item)
    @array << item
  end

  def map(&block)
    result = Array.new
    @array.each_with_index { |item, index| result[index] = block.call(item) }
    result
  end

  def select(&block)
    result = Array.new
    @array.each do |item|
      result << item if block.call(item)
    end
    result
  end
end

arr =ArrayClone.new
p arr.length
arr.add(3)
arr.add(4)
arr.add(5)
arr.add(6)
brr = arr.select(&:odd?)
crr = arr.map { |item| item ** 2 }
print brr
puts
print crr
