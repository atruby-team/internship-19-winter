class Student
  attr_accessor :first_name, :last_name,

  def def initialize
    @courses = []
  end

  def full_name
    puts @first_name + " " + @last_name
  end

  def add_cours(course)
    @courses ||= []
    if @courses.index(course) == nil
      @courses << course
    else
      puts "#{course} is exists"
    end
  end

  def show
    p @courses
  end

  def remove_course(course)
    if @courses.index(course) != nil
      @courses.delete(course)
    else 
      puts "#{course} not exists."
    end
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
student.add_cours("Ly")
student.remove_course("Ly")
student.remove_course("Ly")
student.add_cours ("Programming")
student.show
