class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(trip_time, future_weather, from, to)
    @start_city = "#{from}"
    @end_city = "#{to}"
    @travel_time = "#{trip_time}"
    @weather_at_eta = future_weather
  end
end
