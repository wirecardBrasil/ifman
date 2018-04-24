Rails.application.routes.draw do

  root to: 'login#index'

  resources :login

  get '/dashboard', to: 'dashboard#index'

  scope '/feature' do
    delete '/:id', to: 'feature#destroy', as: 'destroy_feature'
    delete '/:id/user/:user', to: 'feature#delete_user', as: 'delete_user'
    get '/new', to: 'feature#new', as: 'new_feature'
    get '/:id', to: 'feature#show', as: 'feature'
    get '/:id/user/:user', to: 'feature#search_user', as: 'search_user'
    get '/:id/search', to: 'feature#search', as: 'feature_search'
    get '/:id/list', to: 'feature#list', as: 'feature_list'
    get '/:id/report', to: 'feature#report', as: 'feature_report'
    post '/', to: 'feature#create', as: 'create_feature'
    post '/:id', to: 'feature#add_user', as: 'add_feature_user'
    put '/:id', to: 'feature#update_percentage', as: 'update_feature_percentage'
  end
end
