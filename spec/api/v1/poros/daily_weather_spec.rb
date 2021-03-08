require 'rails_helper'

describe DailyWeather do
  it 'exists and has attributes' do
    data = {
            "dt": 1615143600,
            "sunrise": 1615123418,
            "sunset": 1615165104,
            "temp": {
                "day": 60.69,
                "min": 43.23,
                "max": 64.69,
                "night": 49.5,
                "eve": 58.55,
                "morn": 43.29
            },
            "feels_like": {
                "day": 54.75,
                "night": 42.93,
                "eve": 52,
                "morn": 35.13
            },
            "pressure": 1017,
            "humidity": 29,
            "dew_point": 19.76,
            "wind_speed": 3.29,
            "wind_deg": 165,
            "weather": [{
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                    }],
            "clouds": 100,
            "pop": 0,
            "uvi": 4.53
            }

      daily_weather = DailyWeather.new(data)
      expect(daily_weather).to be_a(DailyWeather)
      expect(daily_weather.date).to eq("2021-03-07")
      expect(daily_weather.sunrise).to eq("2021-03-07 06:23:38 -0700,")
      expect(daily_weather.sunset).to eq("2021-03-07 17:58:24 -0700")
      expect(daily_weather.max_temp).to eq(64.69)
      expect(daily_weather.min_temp).to eq(43.23)
      expect(daily_weather.conditions).to eq("overcast clouds")
      expect(daily_weather.icon).to eq("04d")
  end
end
