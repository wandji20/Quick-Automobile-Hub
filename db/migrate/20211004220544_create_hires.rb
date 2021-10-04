class CreateHires < ActiveRecord::Migration[6.1]
  def change
    create_table :hires do |t|
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
