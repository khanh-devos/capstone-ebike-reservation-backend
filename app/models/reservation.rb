class Reservation < ApplicationRecord
  belongs_to :ebike, foreign_key: 'ebike_id'
  belongs_to :user, foreign_key: 'user_id'

  def formated_starting_date
    starting_date.strftime('%Y-%m-%d')
  end

  def formated_ending_date
    ending_date.strftime('%Y-%m-%d')
  end
end
