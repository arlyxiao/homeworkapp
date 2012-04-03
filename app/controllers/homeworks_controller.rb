class HomeworksController < ApplicationController
  before_filter :pre_load
  
  def pre_load
    return redirect_to '/' unless current_user.is_teacher?
  end
  
  
  def create
    @homework = current_user.homeworks.build(params[:homework])
    return redirect_to @homework if @homework.save

    error = @homework.errors.first
	  flash.now[:error] = "#{error[0]} #{error[1]}"
	  redirect_to '/homeworks/new'
  end

  def new
    @homework = Homework.new
    
    # 所有课程
    @courses = Course.all
    
    # 学生列表
    @students = Student.all
  end

  def index
    @homeworks = current_user.homeworks
  end

  def show
    @homework = Homework.find(params[:id])
    @unsubmitted_students = @homework.unsubmitted_students
    @submitted_students = @homework.submitted_students
  end

end
