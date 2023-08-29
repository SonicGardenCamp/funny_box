Rails.application.routes.draw do

  root 'static_pages#home'

  resources :users
  resources :groups
  post "add_user/:id",   to: "groups#add_user", as: "add_user"
end
