class Student < ApplicationRecord
  belongs_to :course
  before_destroy :destroy_grades

  has_many :grades
  has_many :exams, through: :grades

  # Validations
  ## name
  validates :name,
            presence: true,
            length: {maximum: 20},
            allow_blank: false
   
  ## last_name
  validates :last_name,
            presence: true,
            length: {maximum: 20},
            allow_blank: false

  ## dni
  validates :dni,
            presence: true,
            numericality: { only_integer: true, greater_than: 0}

  ## student_number
  validates :student_number,
            presence: true,
            numericality: { only_integer: true, greater_than: 0}



  ## email
  validates :email,
            presence: true,
            valid_email:  true


  ## course_id
  validates :course,
            presence: true

  def destroy_grades
    grades.destroy_all
  end

  def grade_for(exam)
    return self.grades.find_by(exam: exam).try(:grade) || "ausente"
  end

  def to_s
    "#{self.name} #{self.last_name}"
  end
end
