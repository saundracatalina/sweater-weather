class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UsersSerializer.new(user), status: :ok
    else
      render json: {error: 'Incorrect login credentials, please try again'}, status: :bad_request
    end
  end
end
