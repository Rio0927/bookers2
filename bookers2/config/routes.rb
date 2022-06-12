Rails.application.routes.draw do
  root to: "homes#top"
  get 'home/about' => 'homes#new', as: 'homes'
  devise_for :users

  resources:books
  resources:users
  resources :books, only: [:new, :create, :index, :show, :destroy] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
