class HiresController < ApplicationController
  before_action :require_login
  def index
    @hires = current_user.hires
    json_response({hires: @hires})
  end

  def create
    @hire = current_user.hired_cars.build(hire_params)
    if @hire.save
        json_response({hire: @hire})
      else
        json_response({error: @hire.errors.full_messages}, :unprocessable_entity)
    end
  end

  def update
    @hire = Hire.find(:id)
    if @hire.update(hire_params)
      json_response({hire: @hire})
    else
      json_response({error: @hire.errors.full_messages}, :unprocessable_entity)
  end
  end

  def destroy
    @hire = Hire.find(:id)
    if @hire.destroy
      json_response({ message: 'Request Cancelled' })
    else
      json_response({ error: @hire.errors.full_messages })
    end
  end

  private
  def hire_params
    params.permit(:id, :status)
  end
end
