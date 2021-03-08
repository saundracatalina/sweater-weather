class Munchie
  attr_reader :destination_city,
              :travel_time,
              :forecast,
              :restaurant

  def initialize(destination, route_details, weather_details, restaurant)
    @destination_city = "#{destination}"
    @travel_time = route_details[:route][:formattedTime]
    @forecast = {
                summary: weather_details.current_weather.conditions,
                temperature: weather_details.current_weather.temperature
              }
    @restaurant = {
                name: restaurant[:businesses][0][:name],
                address: restaurant[:businesses][0][:location][:display_address].join(" ")
              }
  end
end
