input = [-1,2,3]

case input.length
when 0
  p 0
when 1, 2, 3
  p input.reduce(2,:*)
else
  tmp = input.sort 
  p tmp[-1] * tmp[-2] * tmp[-3]
end

