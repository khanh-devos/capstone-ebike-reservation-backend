class Ebike < ApplicationRecord
  # has_one_attached :image

  has_many :reservations, foreign_key: 'user_id'

  belongs_to :user, foreign_key: 'seller_id'

  validates :name, presence: true
  validates :price, presence: true
  validates :city, presence: true
end
