class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = current_user
  end

  def new
    @user = current_user
    if @user.admin
      @attraction = Attraction.new
    else
      flash[:msg] = "Not Authorized"
      redirect_to attractions_path
    end
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.valid?
      @attraction.save
      redirect_to attractions_path
    else
      flash[:error] = @attraction.errors.full_message
      redirect_to new_attraction_path
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
    # @user = current_user
    # if @user.admin
    #   @attraction = Attraction.new
    # else
    #   flash[:msg] = "Not Authorized"
    #   redirect_to attractions_path
    # end
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attractions_path
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end
