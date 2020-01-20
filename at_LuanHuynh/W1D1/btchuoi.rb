puts 'hay nhap ten:'
ten = gets.chomp
puts 'nhap email:'
email= gets.chomp


if ten==""
    puts "chua nhap ten"
elsif puts %*Xin chao "#{ten.capitalize}"*
end
if email .include?("@")
    puts %*Email cua ban la "#{email}"*
else puts "Email sai dinh dang"
end
