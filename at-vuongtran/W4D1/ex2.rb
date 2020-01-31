# returns a lambda or proc that given one param and returns param + num.
def add_more(a)
  lambda = ->(b) { a + b }
  lambda
end

# returns a lambda or proc that given one param and returns param * num
def multi_more(a)
  lambda = ->(b) { a * b }
  lambda
end

# compose any two lambadas or procs above.
def compose(a, b)
  proc = Proc.new do |n|
    b.call(a.call(n))
  end
  proc
end

add = add_more(4)
p add.call(3)

mul = multi_more(10)
p mul.call(3)

con = compose(add, mul)
p con.call(10)
p compose(mul, add).call(10)
