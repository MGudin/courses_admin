class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.integer :grade, null: false
      t.references :student, foreign_key: true
      t.references :exam, foreign_key: true

      t.timestamps
    end
  end
end
