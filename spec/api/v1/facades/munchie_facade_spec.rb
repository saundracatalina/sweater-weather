require 'rails_helper'

describe 'MunchieFacade' do
  describe '.food_trip_details' do
    it 'can be passed a start, destination, and food and return objects of info' do
      from = "Denver,CO"
      to = "Pueblo,CO"
      food = "hamburger"
      data = MunchieFacade.food_trip_details(from, to, food)

      expect(data.destination_city).to eq("Pueblo,CO")
      expect(data.destination_city).to be_a(String)

      expect(data.travel_time).to be_a(String)

      expect(data.forecast).to be_a(Hash)
      expect(data.forecast).to have_key(:summary)
      expect(data.forecast[:summary]).to be_a(String)
      expect(data.forecast).to have_key(:temperature)
      expect(data.forecast[:temperature]).to be_a(Float)

      expect(data.restaurant).to be_a(Hash)
      expect(data.restaurant).to have_key(:name)
      expect(data.restaurant[:name]).to be_a(String)
      expect(data.restaurant).to have_key(:address)
      expect(data.restaurant[:address]).to be_a(String)
    end
  end
end
