json.extract! vehicle_ad, :id, :customer_name, :customer_phone, :customer_message, :vehicle_interest, :ad_link, :brand, :model_name, :release_year, :price, :mileage, :accessories, :created_at, :updated_at
json.url vehicle_ad_url(vehicle_ad, format: :json)
