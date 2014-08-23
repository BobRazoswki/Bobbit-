Rails.application.routes.draw do
  root :to => "pages#index"

  resources :posts do
  	resources :likes
  end

  resources :posts do
  	resources :dislikes
  end

  resources :posts do
  	resources :comments
  end
  
  devise_for :users
  
end
