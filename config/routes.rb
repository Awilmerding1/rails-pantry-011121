Rails.application.routes.draw do
  resources :users, except: [:show, :index, :new, :create, :destroy, :patch, :put] do
    resources(:items, except: [:show, :edit, :update, :destroy, :put])
  end

  resources(:items, except: :put) do
    resources :measurements, only: [:new, :create]
  end

  resources :measurements, only: [:new, :create, :index]
  # get '/items', to: "items#index"
  # get '/items/:id', to: "items#show"
  get '/signup', to: "users#new", as: "signup"
  post '/signup', to: "users#create"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  get "/auth/facebook/callback", to: "sessions#create_with_fb"
  # resources(:items)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
