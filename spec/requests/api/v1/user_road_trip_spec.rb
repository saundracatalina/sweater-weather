require 'rails_helper'

describe "a FE request cycle for a registered user creating a road trip" do
  it "can create a roadtrip when given a start point, destination, and a valid api_key" do
    VCR.use_cassette('road_trip_json_response') do

      user = create(:user)
      params = {
                "origin": "Denver,CO",
                "destination": "Pueblo,CO",
                "api_key": user.api_key
                }
      headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

      expect(response.status).to eq(200)
      expect(response.content_type).to eq('application/json')

      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data]
      attributes = data[:attributes]

      expect(json).to_not have_key(:error)
      expect(json).to have_key(:data)
      expect(data).to be_a(Hash)
      expect(data).to have_key(:id)
      expect(data[:id]).to eq(nil)
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
  it "gives a 401 if credentials are bad" do
    user = create(:user)
    params = {
              "origin": "Denver,CO",
              "destination": "Pueblo,CO",
              "api_key": "not a real key"
              }
    headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }

    post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(401)
    expect(response).to_not be_successful
    expect(json[:error]).to eq("Incorrect credentials, please try again")
  end
  it "gives a 401 if missing a location" do
    user = create(:user)
    params = {
              "origin": "Denver,CO",
              "api_key": user.api_key
              }
    headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }

    post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(400)
    expect(response).to_not be_successful
    expect(json[:error]).to eq("All fields required, please try again")
  end
  it "can create a roadtrip when given a start point, destination, and a valid api_key" do
    VCR.use_cassette('NY_to_LA_trip') do
      user = create(:user)
      params = {
                "origin": "New York,NY",
                "destination": "Los Angeles,CA",
                "api_key": user.api_key
                }
      headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

      expect(response.status).to eq(200)
      expect(response.content_type).to eq('application/json')

      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data]
      attributes = data[:attributes]

      expect(Integer(attributes[:travel_time][0..1])).to be > 37
      expect(attributes[:start_city]).to eq("New York,NY")
      expect(attributes[:end_city]).to eq("Los Angeles,CA")
    end
  end
  # it "can create a roadtrip when given a start point, destination, and a valid api_key" do
  #   VCR.use_cassette('NY_to_UK_trip') do
  #     user = create(:user)
  #     params = {
  #               "origin": "New York,NY",
  #               "destination": "London,",
  #               "api_key": user.api_key
  #               }
  #     headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }
  #
  #     post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)
  #
  #     expect(response).to_not be_successful
  #   end
  # end
end
