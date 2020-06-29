class Profile < ApplicationRecord
  has_many :likes
  has_one_attached :avatar

  validates :name, uniqueness: true

  def net_likes
    likes.sum(:score)
  end

  def ranking_score
    0.8 * day_likes + 0.6 * vowel_consonant_ratio
  end

  private

  def vowel_consonant_ratio
    (count_vowels / count_consonants).to_f
  end

  def count_consonants
    all_characters = description.delete(' ').length
    all_characters - count_vowels
  end

  def count_vowels
    description.downcase.count('aeiou')
  end

  def day_likes
    likes.recent.count
  end
end
