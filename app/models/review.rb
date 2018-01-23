class Review < ApplicationRecord
  validates :title, presence: true
  validates :rating, presence: true, length: {in: 0..5}
  validates :vote, presence: true
  belongs_to :restaurant
  belongs_to :user
end
