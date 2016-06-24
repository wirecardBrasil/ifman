class LoginController < ApplicationController

  def index

  end

  def create
    init_redis params[:user], params[:password]

    redirect_to controller: :dashboard, action: :index
  end

end
