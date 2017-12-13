class Student < ApplicationRecord
  belongs_to :course

  has_many :grades
  has_many :exams, through: :grades
end
