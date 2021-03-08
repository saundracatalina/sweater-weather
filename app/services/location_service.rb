class LocationService
  class << self
    def location_details(location)
      response = conn.get("/geocoding/v1/address?key=#{ENV['MAP_API_KEY']}&location=#{location}")
      JSON.parse(response.body, symbolize_names: true)
    end

    def route_details(from, to)
      response = conn.get("/directions/v2/route?key=#{ENV['MAP_API_KEY']}&from=#{from}&to=#{to}")
      JSON.parse(response.body, symbolize_names: true)
    end

    private

    def conn
      Faraday.new('http://www.mapquestapi.com')
    end
  end
end
