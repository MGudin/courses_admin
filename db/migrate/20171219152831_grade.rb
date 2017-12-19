class Grade < ActiveRecord::Migration[5.1]
  def change
    add_index :grades, [:exam_id, :student_id], unique: true
  end
end
