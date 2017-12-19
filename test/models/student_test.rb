require 'test_helper'

class StudentTest < ActiveSupport::TestCase
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
  
  test "name size should not be greater than 20" do
    student = student_with_attr name: "un nombre realmente muy largo"
    assert_not student.valid?
  end

  test "name size should not be greater than 0" do
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
    student = student_with_attr dni: 12.34
    assert_not student.valid?
  end

  test "dni should be greater than zero" do
    student = student_with_attr dni: -1
    assert_not student.valid?
  end
  test "student_number should be an integer value" do
    student = student_with_attr student_number: 12.34
    assert_not student.valid?
  end

  test "student_number should be greater than zero" do
    student = student_with_attr student_number: -1
    assert_not student.valid?
  end
## Preguntar por validaciones
  test "student email has propper format" do
    student = student_with_attr email: "sarasa"
    puts student.valid?
    assert_not student.valid?
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
                course_id: Course.first)
  end
end
