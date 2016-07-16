class CoursesController < ApplicationController
  respond_to :html, :json
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
    respond_with(@courses)
  end

  def show
  end

  def new
    @course = Course.new
    respond_with(@course)
  end

  def edit
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      flash[:notice] = I18n.t 'controllers.courses.edit.success'
    end

    redirect_to(courses_url)
  end

  def update
    if @course.update(course_params)
      flash[:notice] = I18n.t 'controllers.courses.edit.success'
    end

    redirect_to(courses_url)
  end

  def destroy
    if @course.destroy
      flash[:notice] = I18n.t 'controllers.courses.remove.success'
    end

    redirect_to(courses_url)
  end

  private

    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :description, :status)
    end
end
