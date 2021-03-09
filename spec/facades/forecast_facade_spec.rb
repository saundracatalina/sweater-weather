require 'rails_helper'

describe 'ForecastFacade' do
  describe '.forecast_details' do
    it 'can be passed a location and return the forecast information as objects' do
      VCR.use_cassette('location_specs_as_objects') do

        location = "Denver,CO"
        forecast = ForecastFacade.forecast_details(location)

        expect(forecast.current_weather).to be_an_instance_of(CurrentWeather)
        expect(forecast.daily_weather[0]).to be_an_instance_of(DailyWeather)
        expect(forecast.hourly_weather[0]).to be_an_instance_of(HourlyWeather)
        expect(forecast).to be_an_instance_of(Forecast)
      end
    end
  end
end
