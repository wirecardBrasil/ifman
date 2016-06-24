Rails.application.routes.draw do

  root to: 'login#index'

  resources :login, :feature

  get '/dashboard', to: 'dashboard#index'

end
