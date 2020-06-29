class Like < ApplicationRecord
  belongs_to :profile

  validates :by, uniqueness: true

  scope :recent, -> { where(score: 1).where('created_at > ?', Time.now - 2.hours) }
end
