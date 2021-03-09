require 'rails_helper'

describe "a FE request cycle for registering a user" do
  it "can register a user successfully and generate a unique api key" do
    params = {
        email:  'user@example.com',
        password: 'password',
        password_confirmation: 'password'
      }
    headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }

    post '/api/v1/users', headers: headers, params: JSON.generate(params)

    expect(User.all.count).to eq(1)
    user = User.last
    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(response.content_type).to eq('application/json')

    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data]
    attributes = data[:attributes]
    expect(json).to_not have_key(:error)
    expect(json).to have_key(:data)
    expect(data[:type]).to eq('users')
    expect(data[:id]).to eq(user.id.to_s)
    expect(attributes).to be_a(Hash)
    expect(attributes[:email]).to eq(user.email)
    expect(attributes[:api_key]).to eq(user.api_key)
    expect(attributes).to_not have_key(:password)
    expect(attributes).to_not have_key(:password_confirmation)
  end
  it "cannot register a user if no password is sent with request" do
    params = {
        email:  'user@example.com',
        password_confirmation: 'password'
      }
    headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }

    post '/api/v1/users', headers: headers, params: JSON.generate(params)

    json = JSON.parse(response.body, symbolize_names: true)
    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(json[:error]).to eq("Account was not created, please try again")
  end
  it "cannot register a user if no password_confirmation is sent with request" do
    params = {
        email:  'user@example.com',
        password: 'password',
      }
    headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }

    post '/api/v1/users', headers: headers, params: JSON.generate(params)

    json = JSON.parse(response.body, symbolize_names: true)
    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(json[:error]).to eq("Account was not created, please try again")
  end
  it "cannot register a user if no email is sent with request" do
    params = {
        password: 'password',
        password_confirmation: 'password'
      }
    headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }

    post '/api/v1/users', headers: headers, params: JSON.generate(params)

    json = JSON.parse(response.body, symbolize_names: true)
    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(json[:error]).to eq("Account was not created, please try again")
  end
end
