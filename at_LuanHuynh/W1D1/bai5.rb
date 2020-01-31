arr = [1, 1, 1, 3, 3, 4, 3, 2, 4, 2]
h = {}
arr.each do |val|
  h[val] = arr.count(val)
end
print h 
