class AddDetailsToHire < ActiveRecord::Migration[6.1]
  def change
    add_column :hires, :hirer_id, :integer
    add_index :hires, :hirer_id
    add_column :hires, :hired_car_id, :integer
    add_index :hires, :hired_car_id
  end
end
