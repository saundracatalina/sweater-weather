class Api::V1::BackgroundsController < ApplicationController
  def index
    if params[:location].present?
      render json: ImageSerializer.new(ImageFacade.image_details(params[:location]))
    else
      render status: :bad_request
    end
  end
end
