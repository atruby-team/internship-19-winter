while true
  score = gets.chomp.to_f
  case score
  when 9...10
    puts "A"
    break
  when 8...9
    puts "B"
    break
  when 7...8
    puts "C"
    break

  when 6...7
    puts "D"
    break
  when 0...6
    puts "F"
    break
  else
    puts "Wrong input. Input again: "
    next
  end
end


