Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show, :edit, :update]
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    # resourceとなっている点に注目してください。 単数形にすると、/:idがURLに含まれなくなります。
    # いいね機能の場合は「1人のユーザーは1つの投稿に対して1回しかいいねできない」という仕様であるため、
    # destroyをする際にもユーザーidと投稿(post_image)idが分かれば、どのいいねを削除すればいいのかが特定できます。
    resources :post_comments, only: [:create, :destroy]
    # post_image_post_comments POST   /post_images/:post_image_id/post_comments(.:format) 
    # が生成され、これによりparams[:post_image_id]となる
  end
  
  
  get 'homes/top'
  get "homes/about" => "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
end
