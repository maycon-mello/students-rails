class Course < ActiveRecord::Base
  extend EnumerateIt
  belongs_to :classroom
  has_enumeration_for :status, with: CourseStatus
end
