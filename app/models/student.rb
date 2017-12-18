class Student < ApplicationRecord
  belongs_to :course

  has_many :grades
  has_many :exams, through: :grades

  # Validations
  #   t.string "name", limit: 20, null: false
  validates :name, presence: true
  validates :name, length: {maximum: 20}
  validates :name, length: {minimum: 1}
  # t.string "last_name", limit: 20, null: false
  validates :last_name, presence: true
  validates :last_name, length: {maximum: 20}
  validates :last_name, length: {minimum: 1}
  # t.integer "dni", null: false
  validates :dni, presence: true
  validates :dni, numericality: { only_integer: true}
  validates :dni, numericality: { greater_than: 0}

  # t.integer "student_number", null: false
  validates :student_number, presence: true
  validates :dni, numericality: { only_integer: true}
  validates :dni, numericality: { greater_than: 0}

  # t.bigint "course_id", null: false
  validates :course_id, presence: true

  
end
