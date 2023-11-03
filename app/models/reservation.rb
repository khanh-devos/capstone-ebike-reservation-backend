class Reservation < ApplicationRecord
  belongs_to :ebike, foreign_key: 'ebike_id'
  belongs_to :user, foreign_key: 'user_id'
end
