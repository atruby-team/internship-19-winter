# Create method operator returns a lambda or proc to save: add, sub, multi and div(check div by zero) many numbers.
def add_number(a, b, *n)
  proc = Proc.new { a + b + n.sum }
  proc
end

def sub_number(a, b, *n)
  proc = Proc.new { a - b - n.sum }
  proc
end

def mul_number(a, b, *n)
  proc = Proc.new { a * b * n.reduce(:*) }
  proc
end

def div_number(a, b, *n)
  proc = Proc.new do
    begin
      a / (b * n.reduce(:*))
    rescue => exception
      "can not div by zero"
    end
  end 
  proc
end

add = add_number(1, 2, 3)
p add.call

sub = sub_number(1, 2, 3, 4)
p sub.call

mul = mul_number(1, 2, 3, 4)
p mul.call

div = div_number(10, 1, 3)
p div.call
