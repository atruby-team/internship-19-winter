def remove_odd(array)
  array.reject!{|val| val % 2 != 0}
  print array
end
arr = [3 ,4 ,5 ,4, 6, 7]
remove_odd(arr)
