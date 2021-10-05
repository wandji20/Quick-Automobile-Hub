class AddDetailsToRating < ActiveRecord::Migration[6.1]
  def change
    add_column :ratings, :value, :integer
  end
end
