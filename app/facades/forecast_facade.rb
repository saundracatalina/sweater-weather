class ForecastFacade
  class << self
    def forecast_details(location)
      weather = WeatherService.weather_details(get_coordinates(location))
      Forecast.new(weather)
    end

    def future_forecast_details(location)
      weather = WeatherService.weather_details(get_coordinates(location))
    end

    private
    def get_coordinates(location)
      location = LocationService.location_details(location)
      coord = location[:results][0][:locations][0][:latLng]
    end
  end
end
