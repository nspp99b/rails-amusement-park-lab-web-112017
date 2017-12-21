class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name)
  end

end
