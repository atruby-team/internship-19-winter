def daily_report
  print "Ten: "
  name = gets.chomp
  print "Tuoi: "
  age = gets.chomp
  print "Noi dung: "
  puts"================"
  conten = gets.chomp
  puts "Daily report: #{Time.now}"
  puts "Ten: #{name}"
  puts "Tuoi: #{age}"
  puts "Noi dung: #{conten}"
end
daily_report
