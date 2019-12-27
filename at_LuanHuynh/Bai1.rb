def input
    puts "Nhap vao n (0<= n <= 10): "
    return n = gets.chomp.to_i
end
n = input
if (n < 0) || (n > 10)
    input
elsif n >= 9
    print "A"
elsif n >= 8
    print "B"
elsif n >= 7
    print "C"
elsif n >= 6
    print "D"
else print "F"
end  
