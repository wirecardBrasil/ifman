Rails.application.routes.draw do

  root to: 'login#index'

  resources :login

end
