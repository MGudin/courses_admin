class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :exam
  belongs_to :course

  # Validations
  ## grade
  validates :grade, presence: true
  validates :grade, numericality: true
  validates :grade, numericality: { greater_than_or_equal_to: 0}
  ## exam_id, student_id index
  validates :exam, uniqueness: { scope: :student }
end
