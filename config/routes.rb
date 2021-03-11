Rails.application.routes.draw do
  resources :watch_lists
  resources :memberships
  resources :communities
  resources :follows
  resources :comments
  resources :posts
  resources :likes
  resources :users

  get "/me", to: "users#me"
  post "/login", to: "users#login"
  post "/signup", to: "users#signup"
  patch "/me", to: "users#me"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
