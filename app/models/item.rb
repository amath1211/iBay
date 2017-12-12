class Item < ApplicationRecord
  belongs_to :user

  has_attached_file :photo, styles: {medium:
    "300x300", thumb: "100x100" }

  validates_attachment :photo, presence: true,
    content_type: {content_type: ["image/jpeg", "image/png"] }

  validates :title, presence: true
  validates :title, length: { minimum: 5 }
  validates :description, presence: true
  validates :description, length: { in: 25..500 }
  validates :user_id, presence: true

end
