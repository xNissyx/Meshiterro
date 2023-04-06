class Favorite < ApplicationRecord
  belongs_to :users
  belongs_to :post_image

  def favorited_by?(user)
    favorite.exists?(user_id: user.id)
  end
# 
end
