require 'test_helper'

class GradeTest < ActiveSupport::TestCase

  test "test grade should be present" do
    grade = grade_with_attr grade: nil
    assert_not grade.valid?
  end
  private
  def sample_grade
    Grade.new(grade: 6,
              course_id: 1,
              exam_id: 2,
              student_id: 2)
  end

  def grade_with_attr **attrs
    g = sample_grade
    g.attributes= attrs
    g
  end
              
end
