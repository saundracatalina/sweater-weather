class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      render json: UsersSerializer.new(user), status: :ok
    else
      render json: {error: 'Incorrect login credentials, please try again'}, status: :bad_request
    end
  end

  private

  def session_params
    JSON.parse(request.body.read, symbolize_names: true)
  end
end
