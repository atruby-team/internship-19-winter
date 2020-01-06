input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 11]

def convert_even_odd(arr)
  arr.map! { |item| item.even? ? "even" : "odd" }
  print arr
end

convert_even_odd(input)
