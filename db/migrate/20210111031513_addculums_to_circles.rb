class AddculumsToCircles < ActiveRecord::Migration[5.2]
  def change
    add_column :circles, :customer_id, :integer
    add_column :circles, :genre_id, :integer
  end
end
