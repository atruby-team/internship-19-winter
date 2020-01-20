def add_more(x)
  add = -> (y) { x + y }
  add
end

def multi_more(x)
  multi = -> (y) { x * y }
  multi
end

def add_multi(x,y)
  
end
add4 = add_more(4)
p add4.(5)
multi10 = multi_more(10)
p multi10.(10)
