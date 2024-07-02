Rails.application.routes.draw do
  devise_for :users
  root "posts#index"

  resources :posts,only: [:new, :create, :show] do
    scope module: :posts do
      resources :comments, shallow: true
    end
  end
end
