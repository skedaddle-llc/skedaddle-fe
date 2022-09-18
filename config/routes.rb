Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/dashboard', to: 'dashboard#show'
  delete '/sessions', to: 'sessions#destroy'

  resources :itineraries, except: %i[index edit update]
end
