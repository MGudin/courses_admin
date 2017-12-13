class Exam < ApplicationRecord
  belongs_to :course

  has_many :grades
  has_many :students, through: :grades

  # scope :year ->(aYear) {where(exam_date.year, aYear)}

  
end
