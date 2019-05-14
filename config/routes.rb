Rails.application.routes.draw do
  root to: 'home#index'
  resources :vehicle_ads
  post 'import', to: 'vehicle_ads#import', as: :import
end
