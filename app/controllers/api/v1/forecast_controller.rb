class Api::V1::ForecastController < ApplicationController
  def index
    if params[:location].present?
      render json: ForecastSerializer.new(ForecastFacade.forecast_details(params[:location]))
    else
      render status: 400
    end
  end
end
