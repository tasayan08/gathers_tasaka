class CreateIvenmts < ActiveRecord::Migration[5.2]
  def change
    create_table :ivenmts do |t|
      t.string :title
      t.text :body
      t.boolean :active_status

      t.timestamps
    end
  end
end