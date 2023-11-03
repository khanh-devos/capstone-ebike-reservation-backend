class Reservation < ApplicationRecord
  belongs_to :ebike, foreign_key: 'user_id'

  validates :is_date?
  validates :is_date?

  private

  def is_date?
    return unless !starting_date.is_a?(Date) || !ending_date.is_a?(Date)
    errors.add(:starting_date, 'must be a valid date')
  end
end
