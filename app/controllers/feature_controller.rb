class FeatureController < ApplicationController

  def new
  end

  def show
    @feature = params[:id]

    @redis = redis_connection
    @percentage = @redis.get("feature:#{@feature}:percentage")
    @users = @redis.smembers("feature:#{@feature}:users")
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

  def add_user
    puts "PARAMS ===============================> #{params.inspect}"
    puts "----------------------------- add_users #{params[:id]}"

    redis_connection.sadd("feature:#{params[:id]}:users", params[:user])

    render nothing: true, status: 200
  end

  def update_percentage
    puts "-----------------------------  update_percentage params[:id]"
  end

end
