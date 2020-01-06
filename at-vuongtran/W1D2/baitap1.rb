def sayDaylyReport
	p "Input name: "
	name = gets.chomp
	p "Input age: "
	age = gets.chomp
	p "Content: "
	content = gets.chomp
	puts "------------------------"
	puts (<<~DaylyReport)
        "Daily Report: #{Time.now.strftime("%Y-%m-%d")}
	ten: #{name}
	Tuoi: #{age}
	Noi dung: #{content}"
	DaylyReport
end

