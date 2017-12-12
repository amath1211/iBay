class Photo < ApplicationRecord
  belongs_to :item
  has_attached_file :image
  validates_attachment :image, content_type: { content_type: ["image/jpeg",
  "image/png"] }
end
