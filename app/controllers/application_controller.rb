class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def init_redis(user, password)
    @redis = Redis.new(:url => "redis://:#{password}@#{user}")
  end

end