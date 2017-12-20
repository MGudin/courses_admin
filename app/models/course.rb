class Course < ApplicationRecord
  has_many :exams
  has_many :students

  # Validations
  validates :year, presence: true
  validates :year, uniqueness: true

  scope :exams_by_year, -> (a_year) { find_by(year: a_year).exams}

  def to_s
    self.year.to_s
  end
end
