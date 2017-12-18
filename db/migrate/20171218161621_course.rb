class Course < ActiveRecord::Migration[5.1]
  def change
    add_index :courses, :year, :unique => true
  end
end
