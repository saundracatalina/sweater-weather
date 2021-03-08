class MunchieFacade
  class << self

    def food_trip_details(from, to, food)
      route_details = LocationService.route_details(from, to)
      weather_details = ForecastFacade.forecast_details(to)
      restaurant = FoodFacade.restaurant_details(to, food)

      Munchie.new(to, route_details, weather_details, restaurant)
    end
  end
end
