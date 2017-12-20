require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  ## required attrs tests
  test "test student cant be saved without name" do
    student = student_with_attr name: nil
    assert_not student.valid?
  end

  test "test student cant be saved without last name" do
    student = student_with_attr last_name: nil
    assert_not student.valid?
  end

  test "test student cant be saved without dni" do
    student = student_with_attr dni: nil
    assert_not student.valid?
  end

  test "test student cant be saved without student_number" do
    student = student_with_attr student_number: nil
    assert_not student.valid?
  end
  
  test "test student cant be saved without course_id" do
    student = student_with_attr course_id: nil
    assert_not student.valid?
  end

  test "test student isnt valid without email" do
    student = student_with_attr email: nil
    assert_not student.valid?
  end
  
  ## name validations
  test "name size should not be greater than 20" do
    student = student_with_attr name: "un nombre realmente muy largo"
    assert_not student.valid?
  end

  test "name cant be blank" do
    student = student_with_attr name: ""
    assert_not student.valid?
  end

  test "last_name size should not be greater than 20" do
    student = student_with_attr last_name: "un apellido realmente muy largo"
    assert_not student.valid?
  end

  test "last_name size should not be greater than 0" do
    student = student_with_attr last_name: ""
    assert_not student.valid?
  end

  test "dni should be an integer value" do
    student = student_with_attr dni: Float(12.34)
    assert_not student.valid?
  end

  test "dni should be greater than zero" do
    student = student_with_attr dni: -1
    assert_not student.valid?
  end
  test "student_number should be an integer value" do
    student = student_with_attr student_number: Float(12.34)
    assert_not student.valid?
  end

  test "student_number should be greater than zero" do
    student = student_with_attr student_number: -1
    assert_not student.valid?
  end

  test "student email has propper format" do
    student = student_with_attr email: "sarasa"
    assert_not student.save
  end
  ## methods
  test "student object responds to #get_grades method" do
    student = Student.first
    assert_respond_to student, :get_grades
  end

  test "#get_grades responds a hash with course exams for student" do
    student = Student.first
    assert_instance_of Hash, student.get_grades
  end

  test "#get_grades keys are exams of student's course" do
    student = Student.first
    course = student.course
    exams = course.exams
    grades = student.get_grades
    # test each key is included in all exams
    grades.each_key do |key|
      assert_includes exams, key
    end
    # tests all exams are included in keys array
    exams.each do |exam|
      assert_includes grades.keys, exam
    end
    # key includes exams and exams includes keys <=> keys = exams
    
    # now a course with 2 exams
    course = Course.last # course n2
    student = course.students.first
    exams = course.exams
    grades = student.get_grades
    grades.each_key do |key|
      assert_includes exams, key
    end
    exams.each do |exam|
      assert_includes grades.keys, exam
    end
  end

  # such ugliness... TODO: REFACTOR!
  test "test results with student without absenses " do
    # get a student with no absenses
    student = Student.where(name: "juan").first
    # get the grades hash. { exam: grade ....}
    student_grades = student.get_grades
    # get the exams for the students course. [exam1, exam2, ...]
    exams = student.course.exams
    
    student_grades.each_with_object(exams) do |key_value, ex|
      assert_equal key_value.last,
                   Grade.where(exam: (ex.select {|e| e == key_value.first }.first), student: student)
                     .first
                     .grade
    end
  end
  
  
  private
  def student_with_attr **attrs
    s = sample_student
    s.attributes=attrs
    s
  end

  def sample_student
    Student.new(name: "John",
                last_name: "Doe",
                dni: 32333444,
                student_number: 123232,
                email: "sarasa@gmail.com",
                course: Course.first)
  end
end
