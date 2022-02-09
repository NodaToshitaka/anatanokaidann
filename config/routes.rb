Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get 'home/about' => 'homes#about'

  resources :users, only: [:show,:index,:edit,:update] do
    member do
      patch 'delete'
      get 'confirm_delete'
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end

  resources :stories do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

end
