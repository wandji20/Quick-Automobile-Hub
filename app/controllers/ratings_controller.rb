class RatingsController < ApplicationController
  def create
    @rating = Rating.new(rating_params)
    if @rating.save
      json_response({ rating: @rating })
    else
      json_response({ message: @rating.errors.full_messages }, :unprocessable_entity)
    end
  end

  def update
    @rating = Rating.find(params(:id))
    if @rating.save
      json_response({ rating: @rating })
    else
      json_response({ message: @rating.errors.full_messages }, :unprocessable_entity)
    end
  end

  private

  def rating_params
    params.permit(:id, :car_id, :user_id)
  end
end
