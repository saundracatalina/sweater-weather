require 'rails_helper'

describe 'FoodFacade' do
  describe '.restaurant_details' do
    it 'can be passed a location and food type and return restaurant info' do
      location = "Pueblo,CO"
      food = "hamburger"
      data = FoodFacade.restaurant_details(location, food)

      expect(data).to be_a(Hash)
      expect(data).to have_key(:businesses)
      expect(data[:businesses]).to be_an(Array)
      expect(data[:businesses].count).to eq(1)
      expect(data[:businesses][0]).to be_a(Hash)
      expect(data[:businesses][0]).to have_key(:name)
      expect(data[:businesses][0][:name]).to be_a(String)
      expect(data[:businesses][0]).to have_key(:is_closed)
      expect(data[:businesses][0][:is_closed]).to eq(false)
    end
  end
end
