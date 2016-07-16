class AddStudentToClassrooms < ActiveRecord::Migration
  def change
    add_reference :classrooms, :student, index: true
    add_foreign_key :classrooms, :students, on_delete: :cascade
  end
end
