class ScraperController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  
  def import
    @doc = Nokogiri::HTML(open(params[:file].path))
    vehicle_website_url = @doc.css('tr:nth-child(6) > td > font > a').children.text.scan(/[^(\=)\(\r)\(\n)]/).join
    @vehicle_website = Nokogiri::HTML(open(vehicle_website_url))
    @vehicle_ad = VehicleAd.new(vehicle_ad_params)
    @vehicle_ad.save

    if @vehicle_ad.persisted?
      redirect_to root_path, notice: 'Veículo importado com sucesso!'
    else
      redirect_to root_path, notice: 'Ocorreu um erro ao importar arquivo.'
    end
  end

  def vehicle_ad_params
    {
      customer_name: @doc.css('tr:nth-child(4) > td > font > b:nth-child(1)').first.next.text.strip,
      customer_phone: @doc.css('tr:nth-child(4) > td > font > b:nth-child(5)').first.next.text.scan(/\d/).join,
      customer_message: @doc.css('tr:nth-child(4) > td > font > b:nth-child(8)').first.next.next.text.scan(/[^(\=)\(\r)\(\n)]/).join.strip,
      vehicle_interest: @doc.css('tr:nth-child(6) > td > font > b:nth-child(1)').first.next.text.scan(/[^(\=)\(\r)\(\n)]/).join.strip,
      vehicle_price: @doc.css('tr:nth-child(6) > td > font > b:nth-child(3)').first.next.text.scan(/[\d,]/).join.gsub(/,/, ".").to_f,
      vehicle_release_year: @doc.css('tr:nth-child(6) > td > font > b:nth-child(5)').first.next.text.strip,
      vehicle_ad_link: @doc.css('tr:nth-child(6) > td > font > a').children.text.scan(/[^(\=)\(\r)\(\n)]/).join,
      vehicle_brand: @vehicle_website.xpath('/html/body/main/div[4]/section/div[1]/div[5]/div/div[6]/p').text,
      vehicle_model: @vehicle_website.xpath('/html/body/main/div[4]/section/div[1]/div[5]/div/div[2]/p').text,
      vehicle_mileage: @vehicle_website.xpath('/html/body/main/div[4]/section/div[1]/div[5]/div/div[4]/p').text,
      vehicle_accessories: @vehicle_website.search('div.col-8 > div.vehicle-accessories > div > div > p').map { |element| element.text }
    }
  end
end