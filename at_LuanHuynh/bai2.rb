array = [1,3,5,7,8]
puts array
b = []
array.each do |val|
    if val % 2 == 0
        b << "even"
    else
        b << "odd"
    end
end
print b
