class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name, limit: 20, null: false
      t.string :last_name, limit: 20, null: false
      t.integer :dni, null: false
      t.integer :student_number, null: false

      t.belongs_to :course, index: true, null: false

      t.timestamps
    end
  end
end
