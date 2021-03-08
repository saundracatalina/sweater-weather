class Api::V1::MunchiesController < ApplicationController
  def index
    weather = ForecastFacade.forecast_details(params[:destination])
    x = FoodService.restaurant_details(params[:destination], params[:food])

    # call serializer here that combines FoodFacade info
  end
end
