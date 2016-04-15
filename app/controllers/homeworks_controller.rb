class HomeworksController < ApplicationController
  def index
    homeworks = Homework.all
    render json: homeworks, status: 200
  end
  def show
    homework = Homework.find(params[:id])
    render json: homework, status: 200
  end
  def create
    homework = Homework.new(homework_params)
    if homework.save
      render json: homework, status: 201, location: homework
    else
       render json: homework.errors, status: 422
    end
  end
  def edit
  end
  def update
    homework = Homework.find(params[:id])
    if homework.update(homework_params)
      render json: homework, status: 200
    else
       render json: homework.errors, status: 422
    end
  end
  def destroy
    homework = Homework.find(params[:id])
    homework.destroy  
    head 204
  end
  private
    def homework_params
      params.require(:homework).permit(:name)
    end
end
