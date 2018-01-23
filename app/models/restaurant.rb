class Restaurant < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true, length: {is: 5}
  validates :picture, presence: true
  has_many :reviews
  belongs_to :user
end
