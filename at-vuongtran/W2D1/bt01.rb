def input
  while true
    begin
      score = gets.chomp.to_f
      if(score >= 0 && score <=10)
        return score
      else
        p "Wrong input: Retry"
        next
      end
    rescue
      p "Wrong input: Retry"
      next
    end
  end
end

def get_classification(input)
  case input
  when 0...6
    "F"
  when 6...7
    "D"
  when 7...8
    "C"
  when 8...9
    "B"
  else
    "A"
  end
end

a = input
p get_classification(a)
