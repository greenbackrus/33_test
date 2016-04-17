class CoursesController < ApplicationController
  def index
    courses = Course.all
    render json: courses, status: 200
  end
  def show
    course = Course.find(params[:id])
    render json: course, status: 200
  end
  def create
    course = Course.new(title: course_params[:title])
    if course.save
      # если удалось сохранить курс, то вызываем метод, создающий объекты дисциплин для каждого курса
      # получая наименования, из строки
      render json: course, status: 201, location: course
      course.create_disciplines(course_params[:disciplines])
    else
       render json: course.errors, status: 422
    end
  end
  def edit
  end
  def update
    course = Course.find(params[:id])
    if course.update(course_params)
      render json: course, status: 200
    else
       render json: course.errors, status: 422
    end
  end
  def destroy
    course = Course.find(params[:id])
    course.destroy  
    head 204
  end
  private
    def course_params
      params.require(:course).permit(:title, :disciplines)
    end
end
