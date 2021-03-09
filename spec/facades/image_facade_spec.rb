require 'rails_helper'

describe 'ImageFacade' do
  describe '.image_details' do
    it 'can be passed a location and return image details' do
      VCR.use_cassette('image_details_as_objects') do

        location = "Denver, CO"
        image_info = ImageFacade.image_details(location)

        expect(image_info).to be_an_instance_of(Image)
        expect(image_info.credit).to be_a(Hash)
        expect(image_info.credit[:source]).to be_a(String)
        expect(image_info.credit[:author]).to be_a(String)
        expect(image_info.image).to be_a(Hash)
        expect(image_info.image[:image_url]).to be_a(String)
        expect(image_info.image[:location]).to be_a(String)
      end
    end
  end
end
