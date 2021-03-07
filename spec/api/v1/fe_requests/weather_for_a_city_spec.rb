require 'rails_helper'

describe "a FE request cycle for a specific city's weather" do
  it 'can take a request with a query param of location=denver,co & give back expected JSON' do
    get "api/v1/forcast?location=denver,co"
    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data]
    
    expect(response.status).to eq(200)
    expect(json).to have_key(:data)
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
  end
end
