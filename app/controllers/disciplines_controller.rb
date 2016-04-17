class DisciplinesController < ApplicationController
  def index
    if params[:course].present?
      course  = Course.find(params[:course])
      disciplines = course.disciplines
    else
      disciplines = Discipline.all
    end
    render json: disciplines, status: 200
  end
  def show
    discipline = Discipline.find(params[:id])
    render json: discipline, status: 200
  end
  def create
    discipline = Discipline.new(discipline_params)
    if discipline.save
      render json: discipline, status: 201, location: discipline
    else
       render json: discipline.errors, status: 422
    end
  end
  def edit
  end
  def update
    discipline = Discipline.find(params[:id])
    if discipline.update(discipline_params)
      render json: discipline, status: 200
    else
       render json: discipline.errors, status: 422
    end
  end
  def destroy
    discipline = Discipline.find(params[:id])
    discipline.destroy  
    head 204
  end
  private
    def discipline_params
      params.require(:discipline).permit(:title, :week)
    end
end

