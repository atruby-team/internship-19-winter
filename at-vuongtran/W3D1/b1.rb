class Student
  
  def initialized
    @first_name = ""
    @last_name = ""
    @courses = Array.new
  end

  attr_accessor :first_name, :last_name, :courses

  def full_name
    p @first_name + " " + @last_name
  end

  def add_course(subject)
    @courses ||= []
    @courses << subject
  end

  def show
    print @courses
    puts
  end

  def remove_course(course_name)
    @courses.delete(course_name)
  end

end

student = Student.new
student.first_name = "Kaylene" # "Kaylene"
student.last_name = "Johnson" # "Johnson"
student.first_name # "Kaylene"
student.full_name # "Kaylene Johnson"
student.add_course("Math") # "Math"
student.show # ["Math"]
student.add_course("Math") # false
student.remove_course("English") # false
student.add_course("English") # "English" 
student.remove_course("Math") # "Math"
student.add_course("Programming") # "Programming"
student.show # ["English", "Programming"]
