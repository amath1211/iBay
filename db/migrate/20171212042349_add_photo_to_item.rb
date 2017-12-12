class AddPhotoToItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :photo, foreign_key: true
  end
end
