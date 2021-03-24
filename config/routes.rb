Rails.application.routes.draw do
  resources :users, except: [:new, :create] do
    resources(:items)
  end

  resources(:items) do
    resources :measurements
  end

  resources :measurements
  # get '/items', to: "items#index"
  # get '/items/:id', to: "items#show"
  get '/signup', to: "users#new", as: "signup"
  post '/signup', to: "users#create"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  # resources(:items)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
