class StudentsController < ApplicationController
  respond_to :html, :json
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
    respond_with(@students)
  end

  def show
  end

  def new
    @student = Student.new
    respond_with(@student)
  end

  def edit
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      flash[:notice] = I18n.t 'controllers.students.create.success'
    end

    redirect_to(students_url)
  end

  def update
    if @student.update(student_params)
      flash[:notice] = I18n.t 'controllers.students.edit.success'
    end

    redirect_to(students_url)
  end

  def destroy
    @student.destroy
    flash[:notice] = I18n.t 'controllers.students.remove.success'
    redirect_to(students_url)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :register_number, :status)
    end
end
