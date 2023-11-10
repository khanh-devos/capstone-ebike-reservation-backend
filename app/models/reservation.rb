class Reservation < ApplicationRecord
  belongs_to :ebike, foreign_key: 'ebike_id'
  belongs_to :user, foreign_key: 'user_id'

  def formated_book_date
    book_date.strftime('%Y-%m-%d')
  end
end
