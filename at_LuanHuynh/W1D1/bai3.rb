def maximum(arr)
    arr.sort!
    new_arr = arr.last(3)
    s = 1
    new_arr.each {|val| s *= val}
    print s
end
arr= [-1, -2, 2, 3, 4]
maximum(arr)
