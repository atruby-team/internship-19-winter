def exercise(arr)
  new_arr = []
  arr.each do |val|
    if val % 3 == 0 && val % 5 == 0
      new_arr << val
    end
  end
  print new_arr
end
arr= Array.new(1000) {|i| i.to_i}
exercise(arr)
