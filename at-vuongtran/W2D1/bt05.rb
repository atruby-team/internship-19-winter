arr = [1, 2, 3, 3, 4, 2, 5, 1, 3]

def count_apeariance(arr)
  hash = Hash.new(0)
  arr.each{ |i| hash[i] += 1 }
  p hash
end

count_apeariance(arr)
