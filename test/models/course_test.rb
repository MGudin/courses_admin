require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "course shouldnt save without a year" do
      course = Course.new()
      assert_not course.save
  end

  test "course year should be unique" do
    course = Course.new()
    course.year = 2017
    assert_not course.save
  end
end
