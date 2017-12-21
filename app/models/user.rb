class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides
  validates :password, presence: true
  has_secure_password
end
