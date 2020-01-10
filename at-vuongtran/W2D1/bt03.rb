input = [-1,2,3]

def maximun_value(arr)
  case arr.length
  when 0
    p 0
  when 1, 2, 3
    p arr.reduce(1, :*)
  else
    tmp = arr.sort 
    p tmp[-1] * tmp[-2] * tmp[-3]
  end
end

maximun_value(input)
