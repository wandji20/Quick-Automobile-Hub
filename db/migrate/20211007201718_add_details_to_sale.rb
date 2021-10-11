class AddDetailsToSale < ActiveRecord::Migration[6.1]
  def change
    add_column :sales, :bought_car_id, :integer
    add_index :sales, :bought_car_id
    add_column :sales, :buyer_id, :integer
    add_index :sales, :buyer_id
  end
end
