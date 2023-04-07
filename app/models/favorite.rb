class Favorite < ApplicationRecord
  belongs_to :users, optional: true
  # optional: trueはbelongs_toの外部キーのnilを許可するというもの
  # favorite.save!でValidation failed: Users must existエラーを吐いたのでその対応コード
  
  belongs_to :post_image

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
#
end
