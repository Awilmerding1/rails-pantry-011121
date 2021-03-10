Rails.application.routes.draw do
  # get '/items', to: "items#index"
  # get '/items/:id', to: "items#show"
  resources(:items, only: [:show, :index])
  # resources(:items)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
