def caculator(a, b)
    yield [a, b]
end
puts caculator(10 , 2){|a , b| a + b}
puts caculator(10 , 2){|a , b| a - b}
puts caculator(10 , 2){|a , b| a * b}
puts caculator(10 , 2){|a , b| a / b}