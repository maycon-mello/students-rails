class AddCourseToClassroom < ActiveRecord::Migration
  def change
    add_reference :classrooms, :course, index: true
    add_foreign_key :classrooms, :courses, on_delete: :cascade
  end
end
