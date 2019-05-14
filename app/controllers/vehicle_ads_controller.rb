class VehicleAdsController < ApplicationController
  before_action :set_vehicle_ad, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_ads
  # GET /vehicle_ads.json
  def index
    @vehicle_ads = VehicleAd.all
  end

  # GET /vehicle_ads/1
  # GET /vehicle_ads/1.json
  def show
  end

  # GET /vehicle_ads/new
  def new
    @vehicle_ad = VehicleAd.new
  end

  # GET /vehicle_ads/1/edit
  def edit
  end

  # POST /vehicle_ads
  # POST /vehicle_ads.json
  def create
    @vehicle_ad = VehicleAd.new(vehicle_ad_params)

    respond_to do |format|
      if @vehicle_ad.save
        format.html { redirect_to @vehicle_ad, notice: 'Vehicle ad was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle_ad }
      else
        format.html { render :new }
        format.json { render json: @vehicle_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_ads/1
  # PATCH/PUT /vehicle_ads/1.json
  def update
    respond_to do |format|
      if @vehicle_ad.update(vehicle_ad_params)
        format.html { redirect_to @vehicle_ad, notice: 'Vehicle ad was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle_ad }
      else
        format.html { render :edit }
        format.json { render json: @vehicle_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_ads/1
  # DELETE /vehicle_ads/1.json
  def destroy
    @vehicle_ad.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_ads_url, notice: 'Vehicle ad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_ad
      @vehicle_ad = VehicleAd.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_ad_params
      params.require(:vehicle_ad).permit(:customer_name, :customer_phone, :customer_message, :vehicle_interest, :ad_link, :brand, :model_name, :release_year, :price, :mileage, :accessories)
    end
end
