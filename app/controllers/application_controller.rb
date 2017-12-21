class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :set_course

  def set_course
    @course = Course.find(params[:course_id] || params[:id])
  end
end
