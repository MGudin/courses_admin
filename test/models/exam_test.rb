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
                exam_date: DateTime.new,
                course: Course.first})
    end
    
      
end  
