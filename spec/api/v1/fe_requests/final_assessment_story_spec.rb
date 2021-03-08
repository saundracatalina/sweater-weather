require 'rails_helper'

describe "a FE request cycle for a restaurant, weather, and travel time" do
  it 'can take a request with query params of start, destination, and food' do
    get "/api/v1/munchies?start=denver,co&destination=pueblo,co&food=hamburger"

    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data]
    attributes = data[:attributes]

    expect(response.status).to eq(200)
    expect(json).to have_key(:data)
    expect(data).to have_key(:id)
    expect(data[:id]).to eq(nil)
    expect(data).to have_key(:type)
    expect(data[:type]).to eq("munchie")
    expect(data).to have_key(:attributes)
    expect(attributes).to be_a(Hash)

    expect(attributes).to have_key(:destination_city)
    expect(attributes).to have_key(:travel_time)
    expect(attributes).to have_key(:forecast)
    expect(attributes).to have_key(:restaurant)
    expect(attributes[:destination_city]).to be_a(String)
    expect(attributes[:travel_time]).to be_a(String)
    expect(attributes[:forecast]).to be_a(Hash)
    expect(attributes[:forecast]).to have_key(:summary)
    expect(attributes[:forecast]).to have_key(:temperature)
    expect(attributes[:restaurant]).to be_a(Hash)
    expect(attributes[:restaurant]).to have_key(:name)
    expect(attributes[:restaurant]).to have_key(:address)
  end
end
