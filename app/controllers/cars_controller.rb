class CarsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_login, only: %i[update show]
  def index
    @cars = Car.all.includes(:ratings)
    json_response({ cars: @cars })
  end

  def create
    @car = current_user.cars.build(car_params)
    if @car.save
      json_response({ car: @car })
    else
      json_response({ error: @car.errors.full_messages }, :unprocessable_entity)
    end
  end

  def show
    @car = current_user.cars.find(car_params[:id])
    if @car.nil?
      json_response({ error: 'No record found' }, :unprocessable_entity)
    else
      json_response({ car: @car })
    end
  end

  def update
    @car = current_user.cars.find(car_params[:id])
    if @car.update(car_params)
      json_response({ car: @car })
    else
      json_response({ error: @car.errors.full_messages }, :unprocessable_entity)
    end
  end

  def destroy
    @car = current_user.cars.find(car_params[:id])
    if @car.destroy
      json_response({ message: 'Car deleted' })
    else
      json_response({ error: @car.errors.full_messages })
    end
  end

  def car_params
    # params.require(:car).permit(
    #   :id,
    #   :manufacturer,
    #   :model,
    #   :year,
    #   :mileage,
    #   :location,
    #   :status,
    #   :price
    # )
    params.permit(
      :id,
      :manufacturer,
      :model,
      :year,
      :mileage,
      :location,
      :status,
      :price,
      images: []
    )
  end
end
