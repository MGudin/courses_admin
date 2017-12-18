class Exam < ApplicationRecord
  belongs_to :course

  has_many :grades
  has_many :students, through: :grades

  # Validations
  # t.string "title", limit: 20, null: false
  validates :title, presence: true
  validates :title, length: {maximum: 20}


  # t.text "description", limit: 255
  validates :description, length: {maximum: 255}
  
  # t.integer "min_grade", null: false
  validates :min_grade, presence: true
  validates :min_grade, numericality: { only_integer: true,
                                        greater_than: 0 }
  
  # t.datetime "exam_date", null: false
  validates :exam_date, presence: true
  
  # t.bigint "course_id", null: false
  validates :course, presence: true

  # scope :year ->(aYear) {where(exam_date.year, aYear)}
end
