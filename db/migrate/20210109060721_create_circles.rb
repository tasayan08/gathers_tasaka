class CreateCircles < ActiveRecord::Migration[5.2]
  def change
    create_table :circles do |t|
      t.string :image_id
      t.text :explanation
      t.string :circle_name
      t.string :place
      t.timestamps
    end
  end
end
