class ImageService
  class << self
    def image_details(location)
      response = conn.get("/search/photos?client_id=#{ENV['PHOTO_API_KEY']}&per_page=1&query=location")
      JSON.parse(response.body, symbolize_names: true)
    end

    private

    def conn
      Faraday.new('https://api.unsplash.com')
    end
  end
end
