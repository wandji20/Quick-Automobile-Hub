class AddDetailsToSale < ActiveRecord::Migration[6.1]
  def change
    add_column :sales, :seller_id, :string
    add_index :sales, :seller_id
    add_column :sales, :buyer_id, :string
    add_index :sales, :buyer_id
  end
end
