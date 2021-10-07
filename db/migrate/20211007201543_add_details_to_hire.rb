class AddDetailsToHire < ActiveRecord::Migration[6.1]
  def change
    add_column :hires, :hirer_id, :string
    add_index :hires, :hirer_id
    add_column :hires, :hiree_id, :string
    add_index :hires, :hiree_id
  end
end
