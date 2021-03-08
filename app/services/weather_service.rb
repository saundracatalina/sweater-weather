class WeatherService
  class << self
    def weather_details(lat, lon)
      response = conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely&appid=#{ENV['WEATHER_API_KEY']}")
      JSON.parse(response.body, symbolize_names: true)
    end

    private
    def conn
      Faraday.new('https://api.openweathermap.org')
    end
  end
end
