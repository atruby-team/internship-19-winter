class StringFormat
  def human_name(name)
    name.gsub!(/_/, " ")
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
    s = string.match /[^a-zA-Z]/
    if string == ""
      nil
    elsif  s == nil
      true 
    else
      false
    end       
  end
end
human = StringFormat.new 
p human.human_name("luan_huynh")
human.uniq("Hello world!!!")
p human.only_letters?("LuanHuynh")
