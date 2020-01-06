input = [1, 1, 1, 3, 3, 4, 3, 2, 4, 2]

def find_contain_duplicate(arr)
  arr.size == arr.uniq.size ? true : false
end

find_contain_duplicate(input)
