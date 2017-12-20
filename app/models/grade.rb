class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :exam
  belongs_to :course

  # Validations
  ## grade
  validates :grade,
            presence: true,
            numericality: { greater_than_or_equal_to: 0}
  ## exam_id, student_id index
  validates :exam,
            uniqueness: { scope: :student }


  def self.student_grade student, exam
    find_by(student: student, exam: exam).try(:grade) || "absent"
  end
end
