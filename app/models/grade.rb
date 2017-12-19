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

  
  # tira error. Ver preguntas.
  # validates :exam,
  #           future: true
  # pach?
  # validates_each :exam do |record, attr, value|
  #   if DateTime.new(value.exam_date) > DateTime.now
  #     record.errors.add(attr, "exam didn't happened yed")
  #   end
  # end
  
end
