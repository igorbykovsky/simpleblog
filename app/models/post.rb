class Post < ApplicationRecord
  validates :title, :body, presence: true, length: { minimum: 5 }

  mount_uploader :image, ImageUploader

  has_many :comments, dependent: :destroy
end
