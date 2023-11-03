class Reservation < ApplicationRecord
  belongs_to :ebike, foreign_key: 'user_id'
end
