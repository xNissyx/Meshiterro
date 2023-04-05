class PostImage < ApplicationRecord
  has_one_attached :image
  # アソシエーション
  belongs_to :user
end
