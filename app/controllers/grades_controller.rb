class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  # GET /grades
  # GET /grades.json
  def index
    @exam = Exam.find(params[:exam_id])
    @grades = @exam.grades
  end

  # GET /grades/1
  # GET /grades/1.json
  def show
  end

  # GET /grades/new
  def new
    @exam = Exam.find(params[:exam_id])
    @grade = Grade.new
    @course = @exam.course
  end

  # GET /grades/1/edit
  def edit
  end

  # POST /grades
  # POST /grades.json
  def create

    @grade = Grade.new(grade_params)
    @exam = Exam.find(params[:exam_id])
    @grade.exam = @exam
    @grade.course = @exam.course
    @students = @grade.course.students
    
    respond_to do |format|
      if @grade.save
        format.html { redirect_to exam_grades_path(@grade.exam), notice: 'La nota fue creada exitosamente.' }
        format.json { render :show, status: :created, location: @grade }
      else
        
        format.html { render :new }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to exam_grades_path(@grade.exam), notice: 'La nota se actualizo correctamente.' }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to exam_grades_path(@exam), notice: 'Grade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
      @exam = Exam.find(params[:exam_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      #      params.fetch(:grade, {})
      params.require(:grade).permit(:grade, :course, :student_id, :exam)
    end
end
