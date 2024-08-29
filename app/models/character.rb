class Character < ApplicationRecord
  has_many :character_users
  has_many :users, through: :character_users
end

