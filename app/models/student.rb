class Student < ActiveRecord::Base
  extend EnumerateIt
  belongs_to :classroom
  has_enumeration_for :status, with: StudentStatus
end
