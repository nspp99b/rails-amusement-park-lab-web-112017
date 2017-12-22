class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride

    if attraction.tickets > user.tickets
      "You do not have enough tickets the #{attraction.name}."
    elsif attraction.min_height > user.height
      "You are not tall enough to ride the #{attraction.name}."
    else
      user.happiness += attraction.happiness_rating
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.save
      nil
    end
  end

end
