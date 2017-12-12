class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :item_id, presence: true
  validates :user_id, presence: true
  validates :status, inclusion: { in: %w(pending paid shipped) }

end
