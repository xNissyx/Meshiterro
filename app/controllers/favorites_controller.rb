class FavoritesController < ApplicationController

  def create
    post_image = PostImage.find(params[:post_image_id])
    # favorite = current_user.favorites.new(post_image_id: post_image.id)
    # favoritesにはスキーマ見たらわかるとおりpost_image_idとuser_idの二つの外部キーの情報が必要
    # よってここではcurrent_userという情報と、newのインスタンスにpost_image_idを紐づけている
    # つまり以下のような記述も可能
    favorite = Favorite.new(post_image_id: post_image.id)
    favorite.user_id = current_user.id

    favorite.save
    redirect_to post_image_path(post_image)
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    redirect_to post_image_path(post_image)
  end
end
