class CreateHires < ActiveRecord::Migration[6.1]
  def change
    create_table :hires do |t|
      t.references :car, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :status, default: ''

      t.timestamps
    end
  end
end
