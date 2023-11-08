class AddLocationToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :location, :string
  end
end
