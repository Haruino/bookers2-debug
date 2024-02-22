Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  root :to =>"homes#top"
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments,only: [:create, :destroy]
    resource :favorite, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    member do
      get "followings"
      get "followers"
    end
    resource :relationships, only: [:create, :destroy]
    # resources :usersの中にfollowingsと、followersを追加している→ user_followings, user_followings
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end