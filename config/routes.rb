Rails.application.routes.draw do

  root to: 'login#index'

  resources :login, :feature

  get '/dashboard', to: 'dashboard#index'
  delete '/feature/:feature', to: 'feature#destroy', as: 'destroy_feature'
  put '/feature/:feature', to: 'feature#update', as: 'update_feature'

end
