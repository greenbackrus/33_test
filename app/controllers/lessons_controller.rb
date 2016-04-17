class LessonsController < ApplicationController
  def index
    if params[:course].present?
      course  = Course.find(params[:course])
      lessons = course.lessons
      disciplines = course.disciplines
    else
      lessons = Lesson.all
    end
    render json: lessons, status: 200
  end
  def show
    lesson = Lesson.find(params[:id])
    render json: lesson, status: 200
  end
  def create
    lesson = Lesson.new(lesson_params)
    if lesson.save
      render json: lesson, status: 201, location: lesson
    else
       render json: lesson.errors, status: 422
    end
  end
  def edit
  end
  def update
    lesson = Lesson.find(params[:id])
    if lesson.update(lesson_params)
      render json: lesson, status: 200
    else
       render json: lesson.errors, status: 422
    end
  end
  def destroy
    lesson = Lesson.find(params[:id])
    lesson.destroy  
    head 204
  end
  private
    def lesson_params
      params.require(:lesson).permit(:title, :week)
    end
end
