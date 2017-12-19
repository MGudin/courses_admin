class Exam < ApplicationRecord
  belongs_to :course

  has_many :grades
  has_many :students, through: :grades

  # Validations
  validates :title,
            presence: true,
            length: {maximum: 20}

  validates :description,
            length: {maximum: 255}
  
  validates :min_grade,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }

  validates :exam_date,
            presence: true
  
  validates :course,
            presence: true

  def students_pass_mark
   self.grades.where('grade>=?', self.min_grade).size
  end

  def students_not_pass_mark
    self.grades.where('grade<?', self.min_grade).size
  end
end
