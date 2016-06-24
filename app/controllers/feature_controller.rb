class FeatureController < ApplicationController

  def new

  end

  def create feature
    @redis = redis_connection
    @redis.set("feature:#{feature}:percentage", 0)
  end

  def delete feature
    @redis = redis_connection
    @redis.del("feature:#{feature}:percentage")
    @redis.del("feature:#{feature}:users")
  end

end
