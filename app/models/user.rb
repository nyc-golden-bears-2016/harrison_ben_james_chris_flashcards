class User < ActiveRecord::Base
  has_many :games
  validates :username, uniqueness: true, presence: true
  validates :password, length: {minimum: 8}

  has_secure_password
end
