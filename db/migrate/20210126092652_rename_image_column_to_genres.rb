class RenameImageColumnToGenres < ActiveRecord::Migration[5.2]
  def change
    rename_column :genres, :image, :image_id
  end
end
