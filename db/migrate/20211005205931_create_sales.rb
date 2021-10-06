class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.references :car, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :status, default: ''

      t.timestamps
    end
  end
end
