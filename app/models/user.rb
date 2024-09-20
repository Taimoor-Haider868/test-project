class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable
  

  # Associations
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :liked_posts , through: :likes ,source: :post

  has_one_attached :profile_image
  validate :validate_image_format

  private

  def validate_image_format
    return unless profile_image.attached?
    
    acceptable_types = ["image/jpg", "image/jpeg", "image/png"]
    unless acceptable_types.include?(profile_image.content_type)
      errors.add(:profile_image, 'must be a PNG or JPG')
    end
  end
end
