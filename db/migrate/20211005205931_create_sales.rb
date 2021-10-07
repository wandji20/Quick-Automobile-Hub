class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.string :status, default: ''

      t.timestamps
    end
  end
end
