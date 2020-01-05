#print sum of int array
input = [1, 2, 3, 4, 5]
p input.sum

#print element from 0..1000 that can be divided by 3 and 5
new_array = (0..1000).select { |i| i % 15 == 0 }
p new_array


input.select!(&:even?)
p input

#
input = [{ Bob: 7 }, { Smith: 8 }, { Kate: 9 }]
input.select { |item| item.to_a[1] >=8 }