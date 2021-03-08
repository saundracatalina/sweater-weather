class FoodFacade
  class << self

    def restaurant_details(location, food)
      restaurant = FoodService.restaurant_details(location, food)
    end
  end
end
