require 'rails_helper'

describe Forecast do
  it 'can take json from APIs, turn it into objects and filter unwanted attributes out' do
    data = {
    "lat": 39.7385,
    "lon": -104.9849,
    "timezone": "America/Denver",
    "timezone_offset": -25200,
    "current": {
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
        "weather": [
            {  "id": 804,
                "main": "Clouds",
                "description": "overcast clouds",
                "icon": "04n" }]},
    "hourly": [{
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
        },
        {  "dt": 1615176000,
            "temp": 52.12,
            "feels_like": 45.43,
            "pressure": 1016,
            "humidity": 37,
            "dew_point": 27.28,
            "uvi": 0,
            "clouds": 87,
            "visibility": 10000,
            "wind_speed": 4.29,
            "wind_deg": 226,
            "weather": [
                {  "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }],
            "pop": 0
        },
        {  "dt": 1615179600,
            "temp": 50.99,
            "feels_like": 43.88,
            "pressure": 1018,
            "humidity": 42,
            "dew_point": 29.12,
            "uvi": 0,
            "clouds": 84,
            "visibility": 10000,
            "wind_speed": 5.48,
            "wind_deg": 193,
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04n"
                }],
            "pop": 0
        },
        {  "dt": 1615183200,
            "temp": 49.5,
            "feels_like": 42.93,
            "pressure": 1019,
            "humidity": 47,
            "dew_point": 30.34,
            "uvi": 0,
            "clouds": 84,
            "visibility": 10000,
            "wind_speed": 4.83,
            "wind_deg": 195,
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04n"
                }],
            "pop": 0
        },
        {  "dt": 1615186800,
            "temp": 48.63,
            "feels_like": 42.15,
            "pressure": 1019,
            "humidity": 48,
            "dew_point": 30.11,
            "uvi": 0,
            "clouds": 100,
            "visibility": 10000,
            "wind_speed": 4.63,
            "wind_deg": 218,
            "weather": [
                {  "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }],
            "pop": 0
        },
        {  "dt": 1615190400,
            "temp": 47.97,
            "feels_like": 41.52,
            "pressure": 1019,
            "humidity": 49,
            "dew_point": 23.25,
            "uvi": 0,
            "clouds": 100,
            "visibility": 10000,
            "wind_speed": 4.54,
            "wind_deg": 216,
            "weather": [
                {  "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }],
            "pop": 0
        },
        {  "dt": 1615194000,
            "temp": 47.3,
            "feels_like": 40.98,
            "pressure": 1019,
            "humidity": 49,
            "dew_point": 22.24,
            "uvi": 0,
            "clouds": 100,
            "visibility": 10000,
            "wind_speed": 4.16,
            "wind_deg": 208,
            "weather": [
                {  "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }],
            "pop": 0
        },
        {  "dt": 1615197600,
            "temp": 46.58,
            "feels_like": 40.44,
            "pressure": 1018,
            "humidity": 50,
            "dew_point": 21.49,
            "uvi": 0,
            "clouds": 100,
            "visibility": 10000,
            "wind_speed": 3.8,
            "wind_deg": 198,
            "weather": [
                {  "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }],
            "pop": 0
        },
        {  "dt": 1615201200,
            "temp": 46.13,
            "feels_like": 39.96,
            "pressure": 1017,
            "humidity": 51,
            "dew_point": 20.98,
            "uvi": 0,
            "clouds": 100,
            "visibility": 10000,
            "wind_speed": 3.87,
            "wind_deg": 200,
            "weather": [
                {  "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }],
            "pop": 0
        },
        {  "dt": 1615204800,
            "temp": 45.9,
            "feels_like": 39.52,
            "pressure": 1018,
            "humidity": 51,
            "dew_point": 20.12,
            "uvi": 0,
            "clouds": 100,
            "visibility": 10000,
            "wind_speed": 4.18,
            "wind_deg": 221,
            "weather": [
                {  "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }],
            "pop": 0
        }
    ],
    "daily": [
        {  "dt": 1615143600,
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
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": 100,
            "pop": 0,
            "uvi": 4.53
        },
        {  "dt": 1615230000,
            "sunrise": 1615209724,
            "sunset": 1615251567,
            "temp": {
                "day": 56.61,
                "min": 45.63,
                "max": 62.29,
                "night": 48.9,
                "eve": 57.51,
                "morn": 45.63
            },
            "feels_like": {
                "day": 51.33,
                "night": 41.52,
                "eve": 51.8,
                "morn": 39.54
            },
            "pressure": 1013,
            "humidity": 33,
            "dew_point": 18.37,
            "wind_speed": 2.01,
            "wind_deg": 144,
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": 100,
            "pop": 0,
            "uvi": 4.29
        },
        {   "dt": 1615316400,
            "sunrise": 1615296030,
            "sunset": 1615338029,
            "temp": {
                "day": 59.45,
                "min": 43.74,
                "max": 63.23,
                "night": 49.98,
                "eve": 58.12,
                "morn": 43.74
            },
            "feels_like": {
                "day": 52.86,
                "night": 43.99,
                "eve": 50.04,
                "morn": 36.66
            },
            "pressure": 1007,
            "humidity": 29,
            "dew_point": 16.97,
            "wind_speed": 4.21,
            "wind_deg": 20,
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": 100,
            "pop": 0,
            "uvi": 5.03
        },
        {   "dt": 1615402800,
            "sunrise": 1615382335,
            "sunset": 1615424492,
            "temp": {
                "day": 48.38,
                "min": 39.58,
                "max": 49.96,
                "night": 40.19,
                "eve": 47.88,
                "morn": 39.58
            },
            "feels_like": {
                "day": 35.74,
                "night": 31.33,
                "eve": 40.15,
                "morn": 33.48
            },
            "pressure": 1006,
            "humidity": 34,
            "dew_point": -1.88,
            "wind_speed": 13.78,
            "wind_deg": 269,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": 0,
            "pop": 0.07,
            "uvi": 5.09
        },
        {  "dt": 1615489200,
            "sunrise": 1615468640,
            "sunset": 1615510954,
            "temp": {
                "day": 42.98,
                "min": 33.44,
                "max": 47.39,
                "night": 33.44,
                "eve": 40.75,
                "morn": 36.81
            },
            "feels_like": {
                "day": 35.35,
                "night": 24.82,
                "eve": 30.2,
                "morn": 28.92
            },
            "pressure": 1009,
            "humidity": 48,
            "dew_point": 6.75,
            "wind_speed": 5.53,
            "wind_deg": 104,
            "weather": [
                {
                    "id": 601,
                    "main": "Snow",
                    "description": "snow",
                    "icon": "13d"
                }
            ],
            "clouds": 73,
            "pop": 0.71,
            "snow": 6.91,
            "uvi": 4.9
        },
        {  "dt": 1615575600,
            "sunrise": 1615554945,
            "sunset": 1615597416,
            "temp": {
                "day": 30.6,
                "min": 25.83,
                "max": 32.95,
                "night": 25.83,
                "eve": 29.41,
                "morn": 31.98
            },
            "feels_like": {
                "day": 19.56,
                "night": 18,
                "eve": 19.06,
                "morn": 23.18
            },
            "pressure": 1017,
            "humidity": 99,
            "dew_point": 30.06,
            "wind_speed": 12.82,
            "wind_deg": 31,
            "weather": [
                {
                    "id": 601,
                    "main": "Snow",
                    "description": "snow",
                    "icon": "13d"
                }
            ],
            "clouds": 100,
            "pop": 1,
            "snow": 25.67,
            "uvi": 5
        }
    ]
}

    forecast = Forecast.new(data)
    expect(forecast).to be_a(Forecast)
    expect(forecast.current_weather).to be_a(CurrentWeather)
    expect(forecast.daily_weather).to be_an(Array)
    expect(forecast.daily_weather.count).to eq(5)
    expect(forecast.daily_weather[0]).to be_a(DailyWeather)
    expect(forecast.hourly_weather).to be_an(Array)
    expect(forecast.hourly_weather.count).to eq(8)
    expect(forecast.hourly_weather[0]).to be_an(HourlyWeather)
  end
end
