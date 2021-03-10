class RoadTripFacade
  class << self
    def road_trip(from, to)
      trip_time = LocationService.road_trip_time(from, to)
      weather = ForecastFacade.future_forecast_details(to)
      hourly_weather = weather[:hourly]
      weather_at_eta = arrival_forecast(trip_time, hourly_weather)
      RoadTrip.new(trip_time, weather_at_eta, from, to)
    end

    private

    def arrival_forecast(trip_time, hourly_weather)
      arrival_time = arrival_hour(trip_time)
      weather_info = hourly_weather.find do |hour|
        time = Time.at(hour[:dt]).strftime('%I:%M:%S')
        time.split(":")[0] == arrival_time
     end
     {temperature: weather_info[:temp],
      conditions: weather_info[:weather][0][:description]}
   end

   def arrival_hour(trip_time)
     split_time = trip_time.split(":")
     departure_time = Time.now
     departure_time += (split_time[0].to_i * 60 * 60)
     departure_time += (split_time[1].to_i * 60)
     departure_time.strftime('%I')
   end
  end
end
