arr = [1, 1, 1, 3, 3, 4, 3, 2, 4, 2]
h = Hash.new(0)
arr.each do |val|
  h[val] += 1
end
print h 
