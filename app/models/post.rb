class Post < ApplicationRecord
  mount_uploader :picture, PictureUploader

  belongs_to :instagram_account

  validates :title, presence: true, length: { maximum: 2000 }
  validates :picture, presence: true
  validates :scheduled_at, presence: true
  validates :instagram_account, presence: true

  validate :check_aspect_ratio, on: :create

  private

  def check_aspect_ratio
    if !picture_cache.nil?
      if picture.width > picture.height
        if picture.width / picture.height.to_f > 1.91
          errors.add(:picture, "supports aspect ratio up to 1.91:1 for landscapes. Your one is too wide.")
        end
      elsif picture.width < picture.height
        if picture.width / picture.height.to_f < 0.8
          errors.add(:picture, "supports aspect ratio up to 4:5 for portraits. Your one is too narrow.")
        end
      end
    end
  end
end
