Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#top'

  get 'home/about' => 'homes#about'

  resources :users, only: [:show, :index, :edit, :update] do
    resources :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings' , as:'followings'
    get 'followers' => 'relationships#followers' , as:'followers'
  end

  resources :books, only: [:show, :index, :edit, :create, :update] do
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  delete 'books/:id' => 'books#destroy', as:'destroy_book'


end
