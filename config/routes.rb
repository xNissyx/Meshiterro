Rails.application.routes.draw do
  
  resources :post_images, only: [:new, :index, :show]
  
  devise_for :users
  get 'homes/top'
  get "homes/about" => "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
end
