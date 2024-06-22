Rails.application.routes.draw do


  devise_for :users
  root to: "home#top"

  resources :books, only: [:new, :index, :show, :create, :edit, :update, :destroy ] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :index, :create, :update]


  get 'home/about' => "home#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
