Rails.application.routes.draw do
  get 'posts/all', to: "posts#index"

  resources :posts do 
    collection do
      get 'my_lent'
    end
  end

  match 'download_posts', to: "posts#download", via: "get"

  devise_for :users 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
