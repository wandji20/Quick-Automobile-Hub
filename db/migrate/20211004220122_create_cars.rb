class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.references :user, null: false, foreign_key: true
      t.string :manufacturer
      t.string :year
      t.number :mileage
      t.string :location
      t.integer :price
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
