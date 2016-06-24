Rails.application.routes.draw do

  root to: 'login#index'

  resources :login, :feature

  get '/dashboard', to: 'dashboard#index'
  delete '/feature/:feature', to: 'feature#destroy', as: 'destroy_feature'

end
