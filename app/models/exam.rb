class Exam < ApplicationRecord
  belongs_to :course

  has_many :grades
  has_many :students, through: :grades

  # Validations
  validates :title, presence: true
  validates :title, length: {maximum: 20}
  validates :description, length: {maximum: 255}
  validates :min_grade, presence: true
  validates :min_grade, numericality: { only_integer: true,
                                        greater_than: 0 }
  validates :exam_date, presence: true
  validates :course, presence: true

  # scope :year ->(aYear) {where(exam_date.year, aYear)}
end
