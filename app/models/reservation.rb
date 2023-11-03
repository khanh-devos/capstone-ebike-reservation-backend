class Reservation < ApplicationRecord
  belongs_to :ebike, foreign_key: 'user_id'

  validates :it_is_date?
  validates :it_is_date?

  private

  def it_is_date?
    return null unless !starting_date.is_a?(Date) || !ending_date.is_a?(Date)

    errors.add(:starting_date, 'must be a valid date')
  end
end
