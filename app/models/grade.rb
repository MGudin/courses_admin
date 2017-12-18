class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :exam
  belongs_to :course
end
