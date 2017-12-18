class Grades < ActiveRecord::Migration[5.1]
  def change
    change_table :grades do |t|
      t.references :course, foreign_key: true, null: false
    end
    change_column_null :grades, :student_id, false
    change_column_null :grades, :exam_id, false
  end
end
