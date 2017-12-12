class RemovePhotoFromItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :image, :photo
  end
end
