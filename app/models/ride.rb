class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride
    answer = "Sorry. "
    if attraction.tickets > user.tickets
      answer += "You do not have enough tickets the #{attraction.name}. "
    end
    if attraction.min_height > user.height
      answer += "You are not tall enough to ride the #{attraction.name}."
    end
    if answer != "Sorry. "
      answer
    else
      nil
    end
  end

end
