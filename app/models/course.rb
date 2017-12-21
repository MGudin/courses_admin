class Course < ApplicationRecord
  has_many :exams
  has_many :students
  has_many :grades
  # Validations
  validates :year, presence: true
  validates :year, uniqueness: true

  # Actions
  before_destroy :destroy_exams_related
  
  scope :exams_by_year, -> (a_year) { find_by(year: a_year).exams}

  def to_s
    self.year.to_s
  end

  private
  def destroy_exams_related
    self.grades.destroy_all
    self.exams.destroy_all
    self.students.destroy_all
    
  end
end
