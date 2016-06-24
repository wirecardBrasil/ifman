class LoginController < ApplicationController

  before_filter :redis_connection, except: [:index, :create]

  def index
  end

  def create
    session[:user] = params[:user]
    session[:password] = params[:password]

    redirect_to controller: :dashboard, action: :index
  end

end
