def daily_report
  print "Ten: "
  ten = gets.chomp
  print "Tuoi: "
  tuoi = gets.chomp
  print "Noi dung: "
  puts"================"
  noidung = gets.chomp
  t = Time.now
  puts "Daily report: #{t}"
  puts "Ten: #{ten}"
  puts "Tuoi: #{tuoi}"
  puts "Noi dung: #{noidung}"
end
daily_report
