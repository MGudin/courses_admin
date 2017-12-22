class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!#, :set_course

  def set_course
    id = params[:course_id] || params[:id]
    @course = Course.find(id) if id
  end
end
