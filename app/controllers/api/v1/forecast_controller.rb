class Api::V1::ForecastController < ApplicationController
  def index
    #first faraday call will be to mapquest
    response = conn.get("/geocoding/v1/address?key=#{ENV['MAP_API_KEY']}&location=#{params[:location]}")
    location = JSON.parse(response.body, symbolize_names: true)
    lat = location[:results][0][:locations][0][:latLng][:lat]
    lng = location[:results][0][:locations][0][:latLng][:lng]

    #second faraday call will be to OpenWeather using the lat/long from MQ
    response_2 = conn_2.get("/data/2.5/onecall?lat=#{lat}&lon=#{lng}&exclude=minutely&appid=#{ENV['WEATHER_API_KEY']}")
    forecast = JSON.parse(response_2.body, symbolize_names: true)

  end

  private
  def conn
    Faraday.new('http://www.mapquestapi.com')
  end

  def conn_2
    Faraday.new('https://api.openweathermap.org')
  end
end
