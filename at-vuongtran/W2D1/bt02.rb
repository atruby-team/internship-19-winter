input = [1,2,3,4,5,6,7,8,9,11]
input.map!{|item| item.even? ? "even" : "odd"}

print input