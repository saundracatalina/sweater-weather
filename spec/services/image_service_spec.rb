require 'rails_helper'

describe 'ImageService' do
  describe '.image_details' do
    it 'returns JSON that includes a link to a relevant image and photographer info' do
      VCR.use_cassette('denver_image_details') do
        location = "Denver, CO"
        data = ImageService.image_details(location)
        results = data[:results]

        expect(results).to be_an(Array)
        expect(results[0]).to be_a(Hash)
        expect(results[0][:urls]).to be_a(Hash)
        expect(results[0][:urls][:raw]).to be_a(String)
        expect(results[0][:links]).to be_a(Hash)
        expect(results[0][:links][:html]).to be_a(String)
      end
    end
  end
end
