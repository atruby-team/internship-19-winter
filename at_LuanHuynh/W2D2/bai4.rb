class StringFormat

  def human_name(name)
    name.gsub!("_", "")
    name_split = name.split(" ")
    name_split.map! { |item| item.capitalize }
    name_split.join(" ")
  end

  def uniq(string)
    str = string.split("")
    str.uniq!
    p string = str.join("")
  end 
  
  def only_letters?(string)
    option = ["1", "2" ,"3", "4", "5", "6", "7", "8", "9"]
    string.each_char do |item| 
      if  option.include?(item) == false
        return true  
      end
      
       
    end
  end
 
end

human = StringFormat.new 
p human.human_name("luan _huynh")
human.uniq("Hello world!!!")
p human.only_letters?("qw1")
