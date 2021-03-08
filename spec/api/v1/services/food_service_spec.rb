require 'rails_helper'

describe 'FoodService' do
  describe '.restaurant_details' do
    it 'returns JSON that includes the info for a restaurant a a specific location' do
      location = "Pueblo,CO"
      food = "hamburger"
      data = FoodService.restaurant_details(location, food)
      require "pry"; binding.pry
  
    end
  end
end
