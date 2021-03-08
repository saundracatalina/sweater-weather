require 'rails_helper'

describe CurrentWeather do
  it 'exists and has attributes' do
    data = {
            "dt": 1615174317,
            "sunrise": 1615123418,
            "sunset": 1615165104,
            "temp": 51.67,
            "feels_like": 45.91,
            "pressure": 1013,
            "humidity": 33,
            "dew_point": 24.49,
            "uvi": 0,
            "clouds": 99,
            "visibility": 10000,
            "wind_speed": 1.99,
            "wind_deg": 136,
            "wind_gust": 3,
            "weather": [{
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04n"
                        }]
              }

    current_weather = CurrentWeather.new(data)
    expect(current_weather).to be_a(CurrentWeather)
    expect(current_weather.datetime).to eq("2021-03-07 20:31:57 -0700")
    expect(current_weather.sunrise).to eq("2021-03-07 06:23:38 -0700")
    expect(current_weather.sunset).to eq("2021-03-07 17:58:24 -0700")
    expect(current_weather.temperature).to eq(51.67)
    expect(current_weather.feels_like).to eq(45.91)
    expect(current_weather.humidity).to eq(33)
    expect(current_weather.uvi).to eq(0)
    expect(current_weather.visibility).to eq(10000)
    expect(current_weather.conditions).to eq("overcast clouds")
    expect(current_weather.icon).to eq("04n")
  end
end
