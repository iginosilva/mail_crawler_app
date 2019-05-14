class HomeController < ApplicationController
  def index
    @vehicle_ads = VehicleAd.all
  end
end
