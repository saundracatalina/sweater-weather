require 'rails_helper'

describe 'LocationService' do
  describe '.location_details' do
    it 'returns JSON that includes the lat/lon of a given city' do
      VCR.use_cassette('location_specs_by_city_and_state') do
        location = "Denver,CO"
        data = LocationService.location_details(location)
        results = data[:results]

        expect(results).to be_an(Array)
        expect(results[0][:locations]).to be_an(Array)
        expect(results[0][:locations][0][:latLng]).to be_a(Hash)
        expect(results[0][:locations][0][:latLng][:lat]).to be_a(Float)
        expect(results[0][:locations][0][:latLng][:lng]).to be_a(Float)
      end
    end
    it 'can return JSON for Hartford,CT' do
      VCR.use_cassette('location_coords_hartford_ct') do
        location = "Hartford,CT"
        data = LocationService.location_details(location)
        results = data[:results]

        expect(results).to be_an(Array)
        expect(results[0][:locations]).to be_an(Array)
        expect(results[0][:locations][0][:latLng]).to be_a(Hash)
        expect(results[0][:locations][0][:latLng][:lat]).to be_a(Float)
        expect(results[0][:locations][0][:latLng][:lng]).to be_a(Float)
      end
    end
  end
  describe '.road_trip_time' do
    it 'returns JSON that includes the travel time of a trip' do
      VCR.use_cassette('road_trip_travel_time') do
        from = "Denver,CO"
        to = "Pueblo,CO"
        data = LocationService.road_trip_time(from, to)

        expect(data).to be_a(String)
      end
    end
  end
end
