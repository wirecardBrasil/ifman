class DashboardController < ApplicationController

  def index
    @redis = redis_connection

    @features = []

    @redis.keys("*feature*").each do |feature|
      @features << /feature:(.+):.*/.match(feature)[1]
    end

  end

end