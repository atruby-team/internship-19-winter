#print sum of int array
def sum(arr)
  p arr.sum
end

#print element from 0..1000 that can be divided by 3 and 5
def divided_elements
  new_array = (0..1000).select { |i| i % 15 == 0 }
  p new_array
end

def remove_odd(input)
  input.select!(&:even?)
  p input
end

def get_good_students(arr)
  print arr.select { |item| item.to_a[1] >=8 }
end

input = [1, 2, 3, 4, 5]
input2 = [{Bob: 7}, {Smith: 8}, {Kate: 9}]
sum(input)
divided_elements
remove_odd(input)
get_good_students(input2)
