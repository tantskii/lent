Rails.application.routes.draw do
  root to: "posts#index"
  get 'posts/all', to: "posts#index"

  get 'posts/settings', to: "posts#settings"

  resources :posts do 
    collection do
      get 'my_lent'
    end
  end

  post 'destroy', to: "source_users#destroy"
  resources :source_users, only: [:create]

  match 'download_posts', to: "posts#download", via: "get"
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
