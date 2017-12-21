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

  ### Update
  ### upon update exams related should change their dates
  ### to reflect the change.
  test "course#update should change exams related dates year" do
    course = Course.second
    course.year = course.year + 1
    course.save
    puts Course.second.year
    course.exams.each do |exam|
      assert_equal course.year, exam.exam_date.year
    end
  end
end
