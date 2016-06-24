class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :redis_connection

  def redis_connection
    @redis ||= Redis.new(:url => "redis://:#{session[:password]}@#{session[:user]}")
  end

end