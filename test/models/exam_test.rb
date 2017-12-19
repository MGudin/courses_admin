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

    ## Students approved quantity
    test "exam responds to students_passed method" do
      exam = Exam.first
      assert_respond_to exam, :students_pass_mark
    end

    test "exam student pass_mark returns 0 when no grades related" do
      exam = sample_exam
      exam.save
      assert_equal 0, exam.students_pass_mark
    end

    test "exam returns correct values based on fixture" do
      exam2 = Exam.find_by(title: "examen_dos")
      assert_equal 1, exam2.students_pass_mark
      exam1 = Exam.first
      assert_equal 1, exam1.students_pass_mark
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
