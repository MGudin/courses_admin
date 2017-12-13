class CreateExams < ActiveRecord::Migration[5.1]
  def change
    create_table :exams do |t|
      t.string :title, limit: 20, null: false
      t.text :description, limit: 50, null: true
      t.integer :min_grade, null: false
      t.datetime :exam_date, null: false

      t.belongs_to :course, index: true, null: false
      
      t.timestamps
    end
  end
end
