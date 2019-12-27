def sum(arr)
  s = 0
  arr.each do |i|
    s += i
  end
  yield(s)
end
a = [1, 2, 3, 1]
sum(a) {|s| puts s}


