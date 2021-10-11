class UsersController < ApplicationController
  # skip_before_action :authorize_request, only: :create
  skip_before_action :verify_authenticity_token
  before_action :require_login, only: %i[update show delete]

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

  def show
    json_response(user: current_user.as_json(except: %i[created_at id updated_at password_digest]), cars: all_cars)
  end

  def update
    @user = current_user
    if @user.update(user_params)
      json_response(@user)
    else
      json_response(@user.errors.full_messages, :unprocessable_entity)
    end
  end

  def destroy
    @user = current_user
    if @user.destroy
      json_response({ message: 'Account deleted' })
    else
      json_response({ error: @user.errors.full_messages })
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

  def all_cars
    hiring_cars = current_user.cars.hiring_cars.includes(:ratings)
    selling_cars = current_user.cars.selling_cars.includes(:ratings)
    { selling_cars: selling_cars, hiring_cars: hiring_cars }
  end
end
