class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :ebikes, foreign_key: 'seller_id'
  has_many :reservations, foreign_key: 'user_id'

  validates :name, uniqueness: true
  validates :email, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

end
