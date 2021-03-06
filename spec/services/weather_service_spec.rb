require 'rails_helper'

describe 'WeatherService' do
  describe '.weather_details' do
    it 'can show the current, hourly, and daily weather details for a given lat/lon' do
      VCR.use_cassette('weather_by_coordinates') do
        coord = {lat: 39.738453, lng: -104.984853 }
        data = WeatherService.weather_details(coord)

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
    it 'can show the current, hourly, and daily weather details for Hartford,CT lat/lon' do
      VCR.use_cassette('hartford_weather_by_coordinates') do
        coord = {lat: 41.765775, lng: -72.673356 }
        data = WeatherService.weather_details(coord)

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
  end
end
