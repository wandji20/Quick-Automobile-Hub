class UsersController < ApplicationController
  # skip_before_action :authorize_request, only: :create
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user = User.new(user_params)
    if @user.save
      @client_user = @user.as_json(only: [:user_name])
      response = { message: 'account_created', Authorization: token(@user.id), user: @client_user }
      json_response(response, :created)
    else
      response = { error: @user.errors.full_messages }
      json_response(response, :unprocessable_entity)
    end
  end

  private

  # def user_params
  #   params.require(:user).permit(
  #     :first_name,
  #     :last_name,
  #     :user_name,
  #     :email,
  #     :telephone,
  #     :password,
  #     :password_confirmation
  #   )
  # end
  def user_params
    params.permit(
      :first_name,
      :last_name,
      :user_name,
      :email,
      :telephone,
      :password,
      :password_confirmation
    )
  end
end
