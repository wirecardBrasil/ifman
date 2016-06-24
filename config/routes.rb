Rails.application.routes.draw do

  root to: 'login#index'

  resources :login, :feature

  get '/dashboard', to: 'dashboard#index'
  delete '/feature/:feature', to: 'feature#destroy', as: 'destroy_feature'
  post '/feature/:id', to: 'feature#add_user', as: 'add_feature_user'
  put '/feature/:id', to: 'feature#update_percentage', as: 'update_feature_percentage'

end
