class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :city
      t.date :start_date
      t.date :end_date
      t.string :address
      t.decimal :address_latitude
      t.decimal :address_longitude

      t.timestamps
    end
  end
end
