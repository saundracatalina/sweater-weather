require 'rails_helper'

describe "a FE request cycle for a registered user creating a road trip" do
  it "can create a road trip when given a start point, destination, and a valid api_key" do
    user = create(:user)
    params = {
              "origin": "Denver,CO",
              "destination": "Pueblo,CO",
              "api_key": user.api_key
              }
    headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }

    post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

    expect(response.status).to eq(201)
    expect(response.content_type).to eq('application/json')

    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data]
    attributes = data[:attributes]

    expect(json).to_not have_key(:error)
    expect(json).to have_key(:data)
    expect(data).to be_a(Hash)
    expect(data).to have_key(:id)
    expect(data[:id]).to eq('nil')
    expect(data).to have_key(:type)
    expect(data[:type]).to eq('roadtrip')
    expect(data).to have_key(:attributes)
    expect(attributes).to be_a(Hash)
    expect(attributes[:start_city]).to be_a(String)
    expect(attributes[:end_city]).to be_a(String)
    expect(attributes[:travel_time]).to be_a(String)
    expect(attributes[:weather_at_eta]).to be_a(Hash)
    expect(attributes[:weather_at_eta]).to have_key(:temperature)
    expect(attributes[:weather_at_eta][:temperature]).to be_a(Numeric)
    expect(attributes[:weather_at_eta]).to have_key(:conditions)
    expect(attributes[:weather_at_eta][:conditions]).to be_a(String)
  end
end
