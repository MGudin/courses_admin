require 'test_helper'

class GradeTest < ActiveSupport::TestCase

  test "test grade should be present" do
    grade = grade_with_attr grade: nil
    assert_not grade.valid?
  end

  test "test grade should be numeric" do
    grade = grade_with_attr grade: "un string"
    assert_not grade.valid?
  end

  test "test grade should be positive" do
    grade = grade_with_attr grade: -1
    assert_not grade.valid?
  end

  test "test grade couldnt be saved without exam, course and student" do
    grade = Grade.new(grade: 7)
    assert_not grade.save
  end

  test "test grade cant be saved if exam_id,student_id already exists" do
    grade = sample_grade()
    grade.save
    another_grade = sample_grade()
    another_grade.course = Course.last
    assert_not another_grade.save
  end

  # test "test grade cant be saved if exam date is future" do
  #   exam = Exam.create title: "un examen futuro",
  #                      description: "sobre Rails 6.5",
  #                      min_grade: 3,
  #                      exam_date: DateTime.tomorrow,
  #                      course: Course.last()
    
  #   grade = grade_with_attr exam: exam
  #   assert_not grade.save
  # end
  
  private
  def sample_grade
    Grade.new(grade: 6,
              course: Course.first,
              exam: Exam.first,
              student: Student.first)
  end

  def grade_with_attr **attrs
    g = sample_grade
    g.attributes= attrs
    g
  end
              
end
