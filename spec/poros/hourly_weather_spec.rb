require 'rails_helper'

describe HourlyWeather do
  it 'exists and has attributes' do
    data = {
            "dt": 1615172400,
            "temp": 51.67,
            "feels_like": 45.28,
            "pressure": 1013,
            "humidity": 33,
            "dew_point": 24.49,
            "uvi": 0,
            "clouds": 99,
            "visibility": 10000,
            "wind_speed": 3.09,
            "wind_deg": 263,
            "weather": [{
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04n"
                        }],
            "pop": 0
            }
      hourly_weather = HourlyWeather.new(data)
      expect(hourly_weather).to be_an(HourlyWeather)
      expect(hourly_weather.time).to eq("08:00:00")
      expect(hourly_weather.temperature).to eq(51.67)
      expect(hourly_weather.conditions).to eq("overcast clouds")
      expect(hourly_weather.icon).to eq("04n")
  end
end
