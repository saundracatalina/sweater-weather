require 'rails_helper'

describe 'WeatherService' do
  it '.weather_details' do
    lat = 39.738453
    lon = -104.984853
    data = WeatherService.weather_details(lat, lon)

    expect(data[:current]).to be_a(Hash)
    expect(data[:current][:temp]).to be_a(Float)
    expect(data[:current][:weather][0][:description]).to be_a(String)

    expect(data[:hourly]).to be_an(Array)
    expect(data[:hourly][0][:temp]).to be_a(Numeric)
    expect(data[:hourly][0][:weather]).to be_an(Array)
    expect(data[:hourly][0][:weather][0][:description]).to be_a(String)

    expect(data[:daily]).to be_an(Array)
    expect(data[:daily][0][:sunrise]).to be_a(Numeric)
    expect(data[:daily][0][:feels_like]).to be_a(Hash)
  end
end
