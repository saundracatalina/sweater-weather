class LocationService
  class << self
    def location_details(location)
      response = conn.get("/geocoding/v1/address?key=#{ENV['MAP_API_KEY']}&location=#{location}")
      JSON.parse(response.body, symbolize_names: true)
    end

    private

    def conn
      Faraday.new('http://www.mapquestapi.com')
    end
  end
end
