class Course < ApplicationRecord
  has_many :exams
  has_many :students
  has_many :grades
  # Validations
  validates :year, presence: true
  validates :year, uniqueness: true

  # Actions
  before_destroy :destroy_related_objects
  after_update :change_exams_year
  
  scope :exams_by_year, -> (a_year) { find_by(year: a_year).exams}

  def to_s
    self.year.to_s
  end

  private
  def destroy_related_objects
    self.grades.destroy_all
    self.exams.destroy_all
    self.students.destroy_all
  end

  def change_exams_year
    self.exams.each do |exam|
      date = DateTime.parse(exam.exam_date.to_s)
      exam.exam_date = date.change year: self.year
      exam.save
    end
  end
end
