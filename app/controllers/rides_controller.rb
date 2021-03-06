class RidesController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @attraction = Attraction.find(params[:attraction_id])
    @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
    if @ride.take_ride
      flash[:msg] = @ride.take_ride
    else
      @user.happiness += @attraction.happiness_rating
      @user.tickets -= @attraction.tickets
      @user.nausea += @attraction.nausea_rating
      byebug
      @user.save
      flash[:msg] = "Thanks for riding the #{@attraction.name}!"
    end
    redirect_to user_path(@user)
  end

end
