class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    validates :title, presence: true,length: {minimum:3, maximum:277}
    validates :body, presence: true,length: {minimum:3, maximum:822}

    has_one_attached :cover_image
end