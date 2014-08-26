Rails.application.routes.draw do
  root :to => "pages#index"
get '/posts/hot', to: 'posts#hot'
get '/posts/controversial', to: 'posts#controversial'
  devise_for :users

  resources :posts do
  	resources :likes
  end

  resources :posts do
  	resources :dislikes
  end

  resources :posts do
  	resources :comments
  end
  
end
