class Like < ApplicationRecord
  belongs_to :profile

  validates :by, uniqueness: true
end
