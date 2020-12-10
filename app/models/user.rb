class User < ActiveRecord::Base
  has_many :trips
  has_many :resorts, through: :trips
  has_secure_password
end
