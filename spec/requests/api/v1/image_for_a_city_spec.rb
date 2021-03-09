require 'rails_helper'

describe "a FE request cycle for a specific city's image" do
  it 'can take a request with a query param of location=denver, co & give back expected JSON' do
    VCR.use_cassette('background_image_json_response') do
      location = "Denver, CO"
      get "/api/v1/backgrounds?location=#{location}"

      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data]
      attributes = data[:attributes]

      expect(response.status).to eq(200)
      expect(json).to have_key(:data)
      expect(data).to have_key(:id)
      expect(data[:id]).to eq(nil)
      expect(data).to have_key(:type)
      expect(data[:type]).to eq("image")
      expect(data).to have_key(:attributes)
      expect(attributes).to be_a(Hash)
      expect(attributes).to have_key(:image)
      expect(attributes).to have_key(:credit)
      expect(attributes[:image]).to be_a(Hash)
      expect(attributes[:image]).to have_key(:image_url)
      expect(attributes[:image][:image_url]).to be_a(String)
      expect(attributes[:image]).to have_key(:location)
      expect(attributes[:image][:location]).to be_a(String)
      expect(attributes[:credit]).to be_a(Hash)
      expect(attributes[:credit]).to have_key(:source)
      expect(attributes[:credit][:source]).to be_a(String)
      expect(attributes[:credit]).to have_key(:author)
      expect(attributes[:credit][:author]).to be_a(String)
    end
  end
  it "responds with a 400 status code if no location is provided" do
    get "/api/v1/backgrounds?location="

    expect(response.status).to eq(400)
  end
  it "responds with a 400 status code if no location param is provided" do
    get "/api/v1/backgrounds"

    expect(response.status).to eq(400)
  end
end
