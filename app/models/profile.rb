class Profile < ApplicationRecord
  has_many :likes
  has_one_attached :avatar
end
