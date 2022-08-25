Rails.application.routes.draw do
  mount ActionCable.server => "/cable"


  resources :messages
  resources :conversations, except: [:index]
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # post "/login", to: "sessions#create"

  # get "/me", to: "sessions#show"

  # delete "/logout", to: "sessions#destroy"

  post "/login", to: "application#create"

  post "/me", to: "application#index"

  delete "/logout", to: "application#destroy"


  post "/userconversations", to: "conversations#index"

  post "/myprofile", to: "users#myprofile"

  # post "/newchat", to: "conversations#newchat"

  post "/editstatus", to: "users#editstatus"


end
