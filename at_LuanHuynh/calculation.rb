def calculation(a,b)
   
    yield(a,b)
    
end 
calculation(3,2) {|a, b| puts " Tong: #{a + b}"}
calculation(3,2) {|a, b| puts "Hieu: #{a - b}"}
calculation(3,2) {|a, b| puts " Tich: #{a * b}"}
calculation(3,2) {|a, b| puts " Thuong #{a / b} "}
