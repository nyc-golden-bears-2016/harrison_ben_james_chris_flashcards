class User < ActiveRecord::Base
  has_secure_password
  has_many :rounds

  validates :username, {length: {minimum: 6}, uniqueness: true}
  validates :password, length: {minimum: 8}
end
