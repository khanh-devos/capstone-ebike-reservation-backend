class CreateEbikes < ActiveRecord::Migration[7.0]
  def change
    create_table :ebikes do |t|
      t.string :name, null: false, default: ""

      t.string :model
      t.string :description

      t.float :price, null: false, default: 0
      t.string :city, null: false, default: ""
      t.float :weight, null: false, default: 0

      t.boolean :removed, null: false, default: false

      t.belongs_to :seller, null: false, foreign_key: {to_table: :users}


      t.timestamps
    end

    create_table :reservations do |t|
      t.datetime :starting_date, null: false, default: ""
      t.datetime :ending_date, null: false, default: ""

      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :ebike, null: false, foreign_key: true

      t.timestamps
    end



    

  end
end
