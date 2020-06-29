class Profile < ApplicationRecord
  has_many :likes
  has_one_attached :avatar

  validates :name, uniqueness: true

  def total_score
    likes.sum(:score)
  end
end
