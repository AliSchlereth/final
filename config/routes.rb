Rails.application.routes.draw do

  root to: "links#index"

  resources :links, only: [:index]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  namespace :api do
    namespace :v1 do
<<<<<<< HEAD
      resources :links, only: [:update]
=======
      resources :links, only: [:create, :update]
>>>>>>> 1e8d6aac1c36df844499911938b910d81b7d4189
    end
  end
end
