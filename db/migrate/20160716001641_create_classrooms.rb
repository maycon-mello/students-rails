class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.datetime :entry_at

      t.timestamps null: false
    end
  end
end
