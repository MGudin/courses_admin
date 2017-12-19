class Student < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :email, :string, null: false, limit: 100
  end
end
