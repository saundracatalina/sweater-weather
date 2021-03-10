require 'rails_helper'

describe RoadTrip do
  it 'exists and has attributes' do
    from = "Denver,CO"
    to = "Pueblo,CO"
    trip_time = "01:44:22"
    future_weather = {:temperature=>50.29,
                      :conditions=>"light rain"}

    road_trip = RoadTrip.new(trip_time, future_weather, from, to)

    expect(road_trip).to be_a(RoadTrip)
    expect(road_trip.start_city).to eq(from)
    expect(road_trip.end_city).to eq(to)
    expect(road_trip.travel_time).to eq(trip_time)
    expect(road_trip.weather_at_eta).to eq(future_weather)
    expect(road_trip.weather_at_eta).to be_a(Hash)
    expect(road_trip.weather_at_eta).to have_key(:temperature)
    expect(road_trip.weather_at_eta[:temperature]).to be_a(Numeric)
    expect(road_trip.weather_at_eta).to have_key(:conditions)
    expect(road_trip.weather_at_eta[:conditions]).to be_a(String)
  end
end
