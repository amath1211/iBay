class User < ApplicationRecord
  include BCrypt

  has_many :items, dependent: :destroy
  has_many :transactions, dependent: :destroy


  validates :username, presence: true
  validates :username, length: { minimum: 2 }
  validates :username, uniqueness: true
  validates :full_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :address, presence: true

  def password
    @password ||= Password.new(password_hash) if password_hash
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
