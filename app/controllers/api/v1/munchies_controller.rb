class Api::V1::MunchiesController < ApplicationController
  def index
    # weather = ForecastFacade.forecast_details(params[:destination])
    # x = FoodFacade.restaurant_details(params[:destination], params[:food])
    # call serializer here that combines FoodFacade info
    from = params[:start]
    to = params[:destination]
    food = params[:food]
    render json: MunchieSerializer.new(MunchieFacade.food_trip_details(from, to, food))
  end
end
