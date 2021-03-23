Rails.application.routes.draw do
  resources :users do
    resources(:items)
  end

  resources(:items) do
    resources :measurements
  end

  resources :measurements
  # get '/items', to: "items#index"
  # get '/items/:id', to: "items#show"

  # resources(:items)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
