class AddImageToEbikes < ActiveRecord::Migration[7.0]
  def change
    add_column :ebikes, :image, :string
  end
end
