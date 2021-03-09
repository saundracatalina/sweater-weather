class ImageFacade
  class << self

    def image_details(location)
      image = ImageService.image_details(location)
      Image.new(image, location)
    end

  end
end
