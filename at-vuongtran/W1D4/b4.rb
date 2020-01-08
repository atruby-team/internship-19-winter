class StringFormat
  
  def initialize
    @output =""      
  end

  def human_name(name)
    name.gsub!("_", "")
    temp = name.split(" ")
    @output = temp.reduce("") { |x , y| x += " " + y.capitalize }
  end

  def uniq(str)
    str.split("").uniq.join("")
  end

  def only_letters?(string)
    return nil if !string.instance_of?(String)
    string.each_char do | i | 
      case i
      when 'a'..'z'
        next
      when  'A'..'Z'
        next
      else
        return false
      end
    end
    true
  end

  def show_view
    p @output
  end
end

a = StringFormat.new
a.human_name("Tran minh_ uvong")
a.show_view
p a.uniq("Hello world!!!")
p a.only_letters?("vuo1ng")
