class Item < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :title, length: { minimum: 5 }
  validates :description, presence: true
  validates :description, length: { in: 25..500 }
  validates :user_id, presence: true

end
