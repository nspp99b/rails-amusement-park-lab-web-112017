class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides
  validates :password, presence: true
  validates :name, uniqueness: true
  has_secure_password

  def mood
    if self.happiness < self.nausea
      "sad"
    else
      "happy"
    end
  end

end
