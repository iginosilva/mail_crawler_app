class ChangeColumnsName < ActiveRecord::Migration[5.2]
  def change
    rename_column :vehicle_ads, :ad_link, :vehicle_ad_link
    rename_column :vehicle_ads, :brand, :vehicle_brand
    rename_column :vehicle_ads, :model_name, :vehicle_model
    rename_column :vehicle_ads, :release_year, :vehicle_release_year
    rename_column :vehicle_ads, :price, :vehicle_price
    rename_column :vehicle_ads, :mileage, :vehicle_mileage
    rename_column :vehicle_ads, :accessories, :vehicle_accessories
  end
end