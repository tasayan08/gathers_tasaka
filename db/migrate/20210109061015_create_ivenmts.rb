class CreateIvenmts < ActiveRecord::Migration[5.2]
  def change
    create_table :ivenmts do |t|
      t.integer :customer_id
      t.integer :circle_id
      t.string :title
      t.text :body
      t.string :image
      t.boolean :active_status
      t.timestamps
    end
  end
end
