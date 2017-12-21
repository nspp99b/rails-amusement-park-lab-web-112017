class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides

  def count_users
    self.users.length
  end
end
