class RenameImageColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :image, :image_id
  end
end
