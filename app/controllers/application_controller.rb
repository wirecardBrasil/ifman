class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :redis_connection

  def redis_connection
    if @redis
      @redis = Redis.new(:url => "redis://:#{session[:password]}@#{session[:user]}")
    else
      flash[:error] = "Please, connect to redis"
      redirect_to controller: :login, action: :index
    end
  end

end
