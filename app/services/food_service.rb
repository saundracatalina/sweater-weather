class FoodService
  class << self
    def restaurant_details(location, food)
      response = conn.get("/v3/businesses/search?limit=1&open_now=true&location=#{location}&term=#{food}")
      json = JSON.parse(response.body, symbolize_names: true)
    end

    private

    def conn
    Faraday.new(url: 'https://api.yelp.com') do |req|
      req.headers["Authorization"] = ENV['YELP_API_KEY']
    end
  end
  end
end
