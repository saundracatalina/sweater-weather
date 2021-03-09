require 'rails_helper'

describe "a FE request cycle for a user logging in" do
  it "allows a user to log in successfully" do
    user = create(:user)
    params = {
      'email' => user.email,
      'password' => user.password
    }
    headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }

    post '/api/v1/sessions', headers: headers, params: JSON.generate(params)

    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data]

    expect(response.status).to eq(200)
    expect(json).to be_a(Hash)
    expect(data).to be_a(Hash)
    expect(data[:type]).to be_a(String)
    expect(data[:id]).to be_a(String)
    expect(data[:attributes]).to be_a(Hash)
    expect(data[:attributes][:email]).to be_a(String)
    expect(data[:attributes][:api_key]).to be_a(String)
    expect(data[:attributes][:api_key]).to eq(user.api_key)
  end
  it "gives a 400 with generic error message if email is missing" do
    user = create(:user)
    params = {
      'password' => user.password
    }
    headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }

    post '/api/v1/sessions', headers: headers, params: JSON.generate(params)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(json[:error]).to eq("Incorrect login credentials, please try again")
  end
end
