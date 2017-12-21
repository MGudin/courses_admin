require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "course shouldnt save without a year" do
      course = Course.new()
      assert_not course.valid?
  end

  test "course year should be unique" do
    course = Course.new()
    course.year = 2017
    assert_not course.valid?
  end

  ## Actions
  ### Destroy
  test "course#destroy deletes all exams related" do
    course = Course.second
    course_id = course.id
    course.destroy
    assert_empty Exam.where(course_id: course_id)
  end

  test "course#destroy deletes all grades related" do
    course = Course.second
    course_id = course.id
    course.destroy
    assert_empty Grade.where(course_id: course_id)
  end

  test "course#destroy deletes all students related" do
    course = Course.second
    course_id = course.id
    course.destroy
    assert_empty Student.where(course_id: course_id)
  end

  
end
