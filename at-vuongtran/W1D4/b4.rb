class StringFormat
  def initialize; end

  def human_name(name)
    name.gsub!("_", " ")
    temp = name.split
    temp.map! { |item| item.capitalize }
    @output = temp.join(" ")
  end

  def uniq(str)
    str.split("").uniq.join("")
  end

  def only_letters?(string)
    /[^a-z A-Z]/.match(string).nil? 
  end

  def show_view
    p @output
  end
end

a = StringFormat.new
a.human_name("Tran minh_     _vuong")
a.show_view
p a.uniq("Hello world!!!")
p a.only_letters?("Vuo ng#")
