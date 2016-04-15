class LectionsController < ApplicationController
  def index
    lections = Lection.all
    render json: lections, status: 200
  end
  def show
    lection = Lection.find(params[:id])
    render json: lection, status: 200
  end
  def create
    lection = Lection.new(lection_params)
    if lection.save
      render json: lection, status: 201, location: lection
    else
       render json: lection.errors, status: 422
    end
  end
  def edit
  end
  def update
    lection = Lection.find(params[:id])
    if lection.update(lection_params)
      render json: lection, status: 200
    else
       render json: lection.errors, status: 422
    end
  end
  def destroy
    lection = Lection.find(params[:id])
    lection.destroy  
    head 204
  end
  private
    def lection_params
      params.require(:lection).permit(:name)
    end
end
