require 'rails_helper'

describe 'LocationService' do
  describe '.location_details' do
    it 'returns JSON that includes the lat/lon of a given city' do
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
  describe '.route_details' do
    it 'returns JSON that includes the travel time of a trip' do
      from = "Denver,CO"
      to = "Pueblo,CO"
      data = LocationService.route_details(from, to)

      expect(data[:route]).to be_a(Hash)
      expect(data[:route][:formattedTime]).to be_a(String)
    end
  end
end
