class FeatureController < ApplicationController

  def new

  end

  def create
    @redis = redis_connection
    @redis.set("feature:#{params[:feature]}:percentage", params[:percentage])
    @redis.sadd("feature:#{params[:feature]}:users", params[:users]) if params[:users]

    redirect_to controller: :dashboard, action: :index
  end

  def destroy
    @redis = redis_connection
    @redis.del("feature:#{params[:id]}:percentage")
    @redis.del("feature:#{params[:id]}:users")

    redirect_to controller: :dashboard, action: :index
  end

end
