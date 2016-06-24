Rails.application.routes.draw do

  root to: 'login#index'

  resources :login

  get '/dashboard', to: 'dashboard#index'

  scope '/feature' do
    post '/', to: 'feature#create', as: 'create_feature'
    get '/new', to: 'feature#new', as: 'new_feature'
    delete '/:feature', to: 'feature#destroy', as: 'destroy_feature'
    get '/:id', to: 'feature#show', as: 'feature'
    post '/:id', to: 'feature#add_user', as: 'add_feature_user'
    put '/:id', to: 'feature#update_percentage', as: 'update_feature_percentage'
    delete '/:id/user/:user', to: 'feature#delete_user', as: 'delete_user'
  end

end
