class ClassroomsController < ApplicationController
  respond_to :html
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]

  def index
    @classrooms = Classroom.all
    respond_with(@classrooms)
  end

  def show
  end

  def new
    @classroom = Classroom.new
    respond_with(@classroom)
  end

  def edit
  end

  def create
    @classroom = Classroom.new(classroom_params)
    @classroom.entry_at = Time.now

    if @classroom.save
      flash[:notice] = I18n.t 'controllers.classrooms.create.success'
    end

    redirect_to(classrooms_url)
  end

  def update
    if @classroom.update(classroom_params)
      flash[:notice] = I18n.t 'controllers.classrooms.edit.success'
    end

    redirect_to(classrooms_url)
  end

  def destroy
    if @classroom.destroy
      flash[:notice] = I18n.t 'controllers.classrooms.remove.success'
    end

    redirect_to(classrooms_url)
  end

  private
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    def classroom_params
      params.require(:classroom).permit(:student_id, :course_id, :entry_at)
    end
end
