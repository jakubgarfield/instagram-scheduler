class InstagramAccount < ApplicationRecord
  belongs_to :user

  has_many :posts

  attr_encrypted :password, key: Base64.decode64(Rails.application.secrets.encryption_key)

  validates :user, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validate :valid_credentials

  private

  def valid_credentials
    return unless errors.empty?

    client = InstagramUpload::Client.new(username, password)
    result = client.send(:login)

    if result["status"] == "fail"
      errors.add(:base, :valid_credentials, message: result["message"])
    end
  end
end
