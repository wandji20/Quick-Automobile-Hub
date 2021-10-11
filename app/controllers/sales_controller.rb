class SalesController < ApplicationController
  before_action :require_login
  def index
    @sales = Sale.all
    json_response({ sales: @sales })
  end

  def create
    @sale = current_user.bought_cars.build(sale_params)
    if @sale.save
      json_response({ sale: @sale })
    else
      json_response({ error: @sale.errors.full_messages }, :unprocessable_entity)
    end
  end

  def update
    @sale = Sale.find(:id)
    if @sale.update(sale_params)
      json_response({ sale: @sale })
    else
      json_response({ error: @sale.errors.full_messages }, :unprocessable_entity)
    end
  end

  def destroy
    @sale = sale.find(:id)
    if @sale.destroy
      json_response({ message: 'Request Cancelled' })
    else
      json_response({ error: @sale.errors.full_messages })
    end
  end

  private

  def sale_params
    params.permit(:id, :status)
  end
end
