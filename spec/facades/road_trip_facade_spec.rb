require 'rails_helper'

describe 'RoadTripFacade' do
  describe '.road_trip' do
    it 'can be passed a start and end point and return formatted travel time' do
      VCR.use_cassette('road_trip_specs_as_objects') do
        from = "Denver,CO"
        to = "Pueblo,CO"
        trip = RoadTripFacade.road_trip(from, to)

        expect(trip).to be_an_instance_of(RoadTrip)
        expect(trip.end_city).to be_a(String)
        expect(trip.start_city).to be_a(String)
        expect(trip.travel_time).to be_a(String)
        expect(trip.weather_at_eta).to be_a(Hash)        
      end
    end
  end
end
