class Ebike < ApplicationRecord
  has_many :reservations, foreign_key: 'user_id'

  belongs_to :user, foreign_key: 'seller_id'

  validates :model, presence: true
  validates :price, presence: true
  validates :city, presence: true
  validates :image, presence: true
end
