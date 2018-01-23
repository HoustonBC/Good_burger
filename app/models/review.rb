class Review < ApplicationRecord
  validates :title, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5  }
  validates :vote, presence: true
  belongs_to :restaurant
  belongs_to :user
end
