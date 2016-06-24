Rails.application.routes.draw do

  root to: 'login#index'

  resources :login

  get '/dashboard', to: 'dashboard#index'

end
