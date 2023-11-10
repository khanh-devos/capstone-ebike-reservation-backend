class ChangeReservation < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :ending_date, :datetime

    rename_column :reservations, :starting_date, :book_date
  end
end
