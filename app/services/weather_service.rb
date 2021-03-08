class WeatherService
  class << self
    def weather_details(coord)
      lat = coord[:lat]
      lon = coord[:lng]
      response = conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely&units=imperial&appid=#{ENV['WEATHER_API_KEY']}")
      JSON.parse(response.body, symbolize_names: true)
    end

    private
    def conn
      Faraday.new('https://api.openweathermap.org')
    end
  end
end
