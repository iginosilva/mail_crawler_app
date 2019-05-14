class CreateVehicleAds < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicle_ads do |t|
      t.string :customer_name
      t.string :customer_phone
      t.text :customer_message
      t.string :vehicle_interest
      t.string :ad_link
      t.string :brand
      t.string :model_name
      t.string :release_year
      t.float :price
      t.string :mileage
      t.string :accessories, array: true, default: []

      t.timestamps
    end
  end
end
