Rails.application.routes.draw do
  root 'static_pages#home'
  get    "/signup",  to: "users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"

  resources :users
  resources :groups do
    resources :posts, only: [:create, :destroy]
  end
  post "add_user/:id",   to: "groups#add_user", as: "add_user"
  post "create_tag/:id",   to: "groups#create_tag", as: "create_tag"
end
