require 'rails_helper'

describe "a FE request cycle for a restaurant, weather, and travel time" do
  it 'can take a request with query params of start, destination, and food' do
    get "/api/v1/munchies?start=denver,co&destination=pueblo,co&food=hamburger"

    
  end
end
