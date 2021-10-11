class AuthenticationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  def create
    user = User.find_by(user_name: user_params[:user_name])
    if user&.authenticate(user_params[:password])
      render json: { token: token(user.id), user_name: user.user_name }, status: :created
    else
      render json: { error: ['Sorry, incorrect username or password'] }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:user_name, :password)
  end
end
