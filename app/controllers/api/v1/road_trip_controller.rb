class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user && params[:origin] && params[:destination]
      trip = RoadTripFacade.road_trip(params[:origin], params[:destination])
      render json: RoadtripSerializer.new(trip)
    elsif !user
      render json: {error: 'Incorrect credentials, please try again'}, status: :unauthorized
    else
      render json: {error: 'All fields required, please try again'}, status: :bad_request
    end
  end
end
