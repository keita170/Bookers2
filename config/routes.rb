Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#top'

  get 'home/about' => 'homes#about'

  resources :users, only: [:show, :index,:edit]

  resources :books, only: [:show, :index, :edit, :create,]

  delete 'books/:id' => 'books#destroy', as:'destroy_book'

end
