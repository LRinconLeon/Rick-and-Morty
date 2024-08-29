class User < ApplicationRecord
  has_secure_password
  has_many :character_users
  has_many :characters, through: :character_users
end
