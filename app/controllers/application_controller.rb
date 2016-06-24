class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :redis_connection
  before_filter :connection_available?

  def redis_connection
    @redis ||= Redis.new(url: "redis://:#{session[:password]}@#{session[:user]}")
  rescue
  end

  def connection_available?
    unless redis_connection
      flash[:error] = "Please, connect to redis"
      redirect_to controller: :login, action: :index
    end
  end

end
