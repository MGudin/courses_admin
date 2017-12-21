require 'test_helper'

class ExamTest < ActiveSupport::TestCase

    test "exam shouldnt save when title is missing" do
      exam = exam_with_attr title: nil
      assert_not exam.valid?
    end

    test "exam shouldnt save when 'min grade' is missing" do
      exam = exam_with_attr min_grade: nil
      assert_not exam.valid?
    end

    test "exam shouldnt save when 'exam date' is missing" do
      exam = exam_with_attr exam_date: nil
      assert_not exam.valid?
    end

    test "exam shouldnt save when there isnt course related" do
      exam = exam_with_attr course_id: nil
      assert_not exam.valid?
    end

    test "min grade should be greater than zero" do
      exam = exam_with_attr min_grade: -1
      assert_not exam.valid?
    end  

    test "title length should be less than 20" do
      exam = exam_with_attr title: "este titulo tiene mas de 20 caracteres"
      assert_not exam.valid?
    end

    ## approved students
    test "exam responds to #approved_students method" do
      exam = Exam.first
      assert_respond_to exam, :approved_students
    end

    test "#approved_students returns 0 when no grades related" do
      exam = sample_exam
      exam.save
      assert_equal 0, exam.approved_students
    end

    test "#approved_students returns correct values based on fixture" do
      exam2 = Exam.find_by(title: "examen_dos")
      assert_equal 1, exam2.approved_students
      exam1 = Exam.first
      assert_equal 1, exam1.approved_students
    end

    ## unapproved students
    test "exam responds to #unapproved_students method" do
      exam = Exam.first
      assert_respond_to exam, :unapproved_students
    end

    test "#unapproved_students returns 0 when no grades related" do
      exam = sample_exam
      exam.save
      assert_equal 0, exam.unapproved_students
    end

    test "#unapproved_student returns correct values based on fixture" do
      exam2 = Exam.find_by(title: "examen_dos")
      assert_equal 1, exam2.unapproved_students
      exam1 = Exam.first
      assert_equal 0, exam1.unapproved_students
    end

    ## absent students
    test "exam responds to #absent_students method" do
      exam = Exam.first
      assert_respond_to exam, :absent_students
    end

    test "#absent_students returns students course count when no grades related" do
      exam = sample_exam
      exam.save
      assert_equal 1, exam.absent_students
    end

    test "#absent_students returns correct values based on fixture" do
      exam2 = Exam.find_by(title: "examen_dos")
      assert_equal 1, exam2.absent_students
      exam1 = Exam.find_by(title: "examen_uno")
      assert_equal 0, exam1.absent_students
    end

    ## approved statitics
    test "exam responds to #approved_rate method" do
      exam = Exam.first
      assert_respond_to exam, :approved_rate
    end

    test "#approved_rate should return zero when there are not related grades" do
      exam = sample_exam
      exam.save
      assert_equal 0, exam.approved_rate
    end

    test "#approved_rate returns correct values based on fixture" do
      exam2 = Exam.find_by(title: "examen_dos")
      assert_equal 50, exam2.approved_rate
      exam1 = Exam.find_by(title: "examen_uno")
      assert_equal 100, exam1.approved_rate
    end

    test "#approved_rate rounds results accordingly. IE: 33.33333 = 33.33" do
      exam2 = Exam.find_by(title: "examen_dos")
      student = (exam2.course.students - exam2.students).first
      # create a grade for the student
      Grade.create exam: exam2, student: student, course: exam2.course, grade: exam2.min_grade+1
      assert_equal 66.66, exam2.approved_rate
    end
    ## Actions
    # destroy
    test "test exam on destroy erases all grades related" do
      exam = Exam.find_by(title: "examen_dos")
      exam.destroy
      assert_empty Grade.where(exam_id: exam.id)
    end
    private
    def exam_with_attr **attrs
      # returns a new instance of exam with nil attrs
      exam = sample_exam
      exam.attributes=attrs
      exam
    end
    def sample_exam
      Exam.new({title: "Ruby",
                description: "Conceptos basicos del lenguaje",
                min_grade: 4,
                exam_date: DateTime.now,
                course: Course.first})
    end
    
      
end  
