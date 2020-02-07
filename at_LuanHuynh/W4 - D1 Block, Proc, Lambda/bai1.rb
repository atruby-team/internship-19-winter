def add(a, b, *c)
  proc = Proc.new { a + b + c.sum }
  proc.call
end

def sub(a, b, *c)
  proc = Proc.new { a - b - c.sum }
  proc.call
end

def multi(a, b, *c)
  proc = Proc.new { a * b * c.reduce{ |s, c| s *= c }}
  proc.call
end

def div(a, b, *c)
  proc = Proc.new do 
    if b != 0 && c.reduce{ |s, c| s *= c } != 0
      a / b / c.reduce{ |s, c| s *= c }
    elsif b != 0 && c.reduce{ |s, c| s *= c } == nil
      a / b
    else
      'can not div by zero'
    end
  end
  proc.call
end

p add(1, 2, 3, 4)
p sub(13, 5, 2)
p multi(1, 2, 3, 4)
p div(100, 5, 10)
p div(10, 0)
