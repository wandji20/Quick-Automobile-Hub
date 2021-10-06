class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :email
      t.string :telephone
      t.string :password_digest
      t.boolean :verified, default: true

      t.timestamps
    end
  end
end
