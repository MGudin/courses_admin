class Course < ApplicationRecord
  has_many :exams
  has_many :students

  scope :exams_by_year, -> (a_year) { find_by(year: a_year).exams}
end
