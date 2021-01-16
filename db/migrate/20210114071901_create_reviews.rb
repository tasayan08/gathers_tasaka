class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :customer_id
      t.integer :circle_id
      t.string :title
      t.text :body
      t.integer :rank
      t.string :image_id

      t.timestamps
    end
  end
end
