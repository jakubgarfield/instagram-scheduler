class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :instagram_accounts
  has_many :posts, through: :instagram_accounts

  validates :timezone, presence: true
end
