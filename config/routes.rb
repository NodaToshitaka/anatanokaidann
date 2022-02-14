Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get 'home/about' => 'homes#about'
  get 'search' => 'searches#search'
  get 'sort' => 'sorts#sort'

  resources :users, only: [:show,:index,:edit,:update] do
    member do
      patch 'delete'
      get 'confirm_delete'
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end

  resources :stories do
    collection do
      get :ranking
    end
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  
  resources :contacts, only: [:new, :create] do
    collection do
      post 'confirm'
      post 'back'
      get 'done'
    end
    
  end

end
