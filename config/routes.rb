Rails.application.routes.draw do
  root to: 'home#index'
  resources :vehicle_ads
  post 'import', to: 'scraper#import', as: :import
end
