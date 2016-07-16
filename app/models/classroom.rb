class Classroom < ActiveRecord::Base
  has_one :students
  has_one :courses

  def student
    Student.find(self.student_id)
  end

  def course
    Course.find(self.course_id)
  end
end
