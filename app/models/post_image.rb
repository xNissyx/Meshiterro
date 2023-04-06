class PostImage < ApplicationRecord
  has_one_attached :image
  # アソシエーション
  belongs_to :user
  has_many :post_comment, dependent: :destroy
  has_many :favorite, dependent: :destroy
  
  def favorited_by?(user)
    favorite.exists?(user_id: user.id)
  end
  
  # 画像が投稿されていない場合はエラーが出るのを回避するメソッドの基本
  # def get_image
  #   if image.attached?
  #     image
  #   else
  #     "no_image.jpg"
  #   end
  # end
  # Railsで画像のサイズ変更
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
end
