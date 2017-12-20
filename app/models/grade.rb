class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :exam
  belongs_to :course

  # Validations
  validates :grade,
            presence: true,
            numericality: { greater_than_or_equal_to: 0}

  # uniqueness of index (exam, student)
  validates :exam,
            uniqueness: { scope: :student }
end
