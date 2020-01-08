class Student
  attr_accessor :first_name, :last_name, :course
  def def initialize
    @first_name = ""
    @last_name = ""
    @course = []
  end
  def full_name
    puts @first_name +" " + @last_name
  end
  def add_cours(course)
    @course ||= []
    @course << course
  end
  def show
    print @course
  end
  def remove_course(course)
    @course.delete(course)
  end
end
student = Student.new 
student.first_name = "Luan"
p student.first_name
student.last_name = "Huynh"
p student.last_name
student.full_name
student.add_cours("Toan")
student.add_cours("Ly")
student.show
student.remove_course("Ly")
student.add_cours ("Programming")
student.show
