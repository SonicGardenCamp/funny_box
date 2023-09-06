Rails.application.routes.draw do
  root 'static_pages#home'
  get    "/signup",  to: "users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"

  resources :users, only: %i[new create show edit update destroy]
  resources :groups do
    resources :posts, only: %i[create destroy]
    resources :tags, only: %i[create], module: :groups
  end
  post "enter_leave/:id",   to: "groups#enter_leave", as: "enter_leave"

  resource :capsule_toys, only: %i[show]
end
