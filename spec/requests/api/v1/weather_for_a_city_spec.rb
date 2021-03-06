require 'rails_helper'

describe "a FE request cycle for a specific city's weather" do
  it 'can take a request with a query param of location=denver,co & give back expected JSON' do
    VCR.use_cassette('forecast_json_response') do
      get "/api/v1/forecast?location=denver,co"

      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data]
      attributes = data[:attributes]

      expect(response.status).to eq(200)
      expect(json).to have_key(:data)
      expect(data).to have_key(:id)
      expect(data[:id]).to eq(nil)
      expect(data).to have_key(:type)
      expect(data[:type]).to eq("forecast")
      expect(data).to have_key(:attributes)
      expect(attributes).to be_a(Hash)

      expect(attributes).to have_key(:current_weather)
      expect(attributes[:current_weather]).to be_a(Hash)
      expect(attributes[:current_weather]).to have_key(:datetime)
      expect(attributes[:current_weather][:datetime]).to be_a(String)
      expect(attributes[:current_weather]).to have_key(:sunrise)
      expect(attributes[:current_weather][:sunrise]).to be_a(String)
      expect(attributes[:current_weather]).to have_key(:sunset)
      expect(attributes[:current_weather][:sunset]).to be_a(String)
      expect(attributes[:current_weather]).to have_key(:temperature)
      expect(attributes[:current_weather][:temperature]).to be_a(Float)
      expect(attributes[:current_weather]).to have_key(:feels_like)
      expect(attributes[:current_weather][:feels_like]).to be_a(Float)
      expect(attributes[:current_weather]).to have_key(:humidity)
      expect(attributes[:current_weather][:humidity]).to be_a(Numeric)
      expect(attributes[:current_weather]).to have_key(:uvi)
      expect(attributes[:current_weather][:uvi]).to be_a(Numeric)
      expect(attributes[:current_weather]).to have_key(:visibility)
      expect(attributes[:current_weather][:visibility]).to be_a(Numeric)
      expect(attributes[:current_weather]).to have_key(:conditions)
      expect(attributes[:current_weather][:conditions]).to be_a(String)
      expect(attributes[:current_weather]).to have_key(:icon)
      expect(attributes[:current_weather][:icon]).to be_a(String)

      expect(attributes).to have_key(:daily_weather)
      expect(attributes[:daily_weather]).to be_an(Array)
      expect(attributes[:daily_weather][0]).to have_key(:date)
      expect(attributes[:daily_weather][0][:date]).to be_a(String)
      expect(attributes[:daily_weather][0]).to have_key(:sunrise)
      expect(attributes[:daily_weather][0][:sunrise]).to be_a(String)
      expect(attributes[:daily_weather][0]).to have_key(:sunset)
      expect(attributes[:daily_weather][0][:sunset]).to be_a(String)
      expect(attributes[:daily_weather][0]).to have_key(:max_temp)
      expect(attributes[:daily_weather][0][:max_temp]).to be_a(Float)
      expect(attributes[:daily_weather][0]).to have_key(:min_temp)
      expect(attributes[:daily_weather][0][:min_temp]).to be_a(Float)
      expect(attributes[:daily_weather][0]).to have_key(:conditions)
      expect(attributes[:daily_weather][0][:conditions]).to be_a(String)
      expect(attributes[:daily_weather][0]).to have_key(:icon)
      expect(attributes[:daily_weather][0][:icon]).to be_a(String)
      expect(attributes[:daily_weather].count).to eq(5)

      expect(attributes).to have_key(:hourly_weather)
      expect(attributes[:hourly_weather]).to be_an(Array)
      expect(attributes[:hourly_weather][0][:time]).to be_a(String)
      expect(attributes[:hourly_weather][0]).to have_key(:temperature)
      expect(attributes[:hourly_weather][0][:temperature]).to be_a(Float)
      expect(attributes[:hourly_weather][0]).to have_key(:conditions)
      expect(attributes[:hourly_weather][0][:conditions]).to be_a(String)
      expect(attributes[:hourly_weather][0]).to have_key(:icon)
      expect(attributes[:hourly_weather][0][:icon]).to be_a(String)
      expect(attributes[:hourly_weather].count).to eq(8)

      expect(attributes[:current_weather]).to_not have_key(:pressure)
      expect(attributes[:current_weather]).to_not have_key(:dew_point)
      expect(attributes[:current_weather]).to_not have_key(:clouds)
      expect(attributes[:current_weather]).to_not have_key(:wind_speed)
      expect(attributes[:current_weather]).to_not have_key(:wind_deg)
      expect(attributes[:current_weather]).to_not have_key(:wind_gust)
      expect(attributes[:daily_weather][0]).to_not have_key(:feels_like)
      expect(attributes[:daily_weather][0]).to_not have_key(:humidity)
      expect(attributes[:daily_weather][0]).to_not have_key(:uvi)
      expect(attributes[:daily_weather][0]).to_not have_key(:clouds)
      expect(attributes[:hourly_weather][0]).to_not have_key(:feels_like)
      expect(attributes[:hourly_weather][0]).to_not have_key(:humidity)
      expect(attributes[:hourly_weather][0]).to_not have_key(:pressure)
      expect(attributes[:hourly_weather][0]).to_not have_key(:wind_speed)
      expect(attributes[:hourly_weather][0]).to_not have_key(:wind_deg)
    end
  end
  it "responds with a 400 status code if no location is provided" do
    get "/api/v1/forecast?location="

    expect(response.status).to eq(400)
  end
  it "responds with a 400 status code if no location param is provided" do
    get "/api/v1/forecast"

    expect(response.status).to eq(400)
  end
end
