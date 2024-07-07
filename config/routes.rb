Rails.application.routes.draw do
  devise_for :users

  get "/home" ,to: 'home#index'
  root "posts#index"

  resources :posts,only: [:new, :create, :show] do
    scope module: :posts do
      resources :comments, shallow: true
    end
  end
end
