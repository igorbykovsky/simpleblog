class Post < ApplicationRecord
  validates :title, :body, presence: true, length: { minimum: 5 }

  has_many :comments, dependent: :destroy
end
