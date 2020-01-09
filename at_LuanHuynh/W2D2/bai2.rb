class Array

  def sum
    a = 0
    each do |i|
      if ! (i.is_a?(Integer))
        return nil
      else     
        a += i         
      end       
    end 
    return a 
  end  
end

p [1, 2, 3, 4].sum
p [1, 2, 3, "x"].sum