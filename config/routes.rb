Rails.application.routes.draw do
  resources :posts
  match 'download_posts', to: "posts#download", via: "get"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
