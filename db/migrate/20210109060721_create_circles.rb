class CreateCircles < ActiveRecord::Migration[5.2]
  def change
    create_table :circles do |t|
      t.string :image_id
      t.text :explanation
      t.string :circle_name
      t.string :place
      t.integer :customer_id
      t.integer :genre_id
      t.timestamps
    end


    create_table :genres do |t|
      t.string :genre_name
      t.timestamps
    end


    create_table :places do |t|
      t.timestamps
    end


    create_table :events do |t|
      t.integer :customer_id
      t.integer :circle_id
      t.integer :genre_id
      t.integer :place
      t.string :title
      t.text :body
      t.string :image
      t.boolean :active_status
      t.timestamps
    end



    create_table :reviews do |t|
      t.integer :customer_id
      t.integer :circle_id
      t.string :title
      t.text :body
      t.integer :rank
      t.string :image_id
      t.string :place
      t.timestamps
    end


    create_table :favorite_circles do |t|
      t.integer :customer_id
      t.integer :circle_id

      t.timestamps
    end


    create_table :favorite_events do |t|
      t.integer :customer_id
      t.integer :event_id

      t.timestamps
    end



  end
end
