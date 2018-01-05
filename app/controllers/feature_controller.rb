class FeatureController < ApplicationController

  def new
    @percentage = 0
  end

  def show
    @feature = params[:id]
    @percentage = redis_connection.get("feature:#{@feature}:percentage")
    @cardinality = redis_connection.scard("feature:#{@feature}:users")
    @users = redis_connection.smembers("feature:#{@feature}:users") unless @cardinality > 20
  end

  def create
    if params[:feature].include? ":"
      flash[:error] = "Features names cannot contains \":\""
      redirect_to controller: :feature, action: :new
    else
      redis_connection.set("feature:#{params[:feature]}:percentage", params[:percentage])
      redis_connection.sadd("feature:#{params[:feature]}:users", params[:users]) if params[:users].length > 0

      redirect_to controller: :dashboard, action: :index
    end
  end

  def destroy
    redis_connection.del("feature:#{params[:id]}:percentage")
    redis_connection.del("feature:#{params[:id]}:users")
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  def add_user
    redis_connection.sadd("feature:#{params[:id]}:users", params[:user])
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  def search_user
    sismember = redis_connection.sismember("feature:#{params[:id]}:users", params[:user])
    if sismember
      render nothing: true, status: 200
    else
      render nothing: true, status: 404
    end
  end

  def delete_user
    redis_connection.srem("feature:#{params[:id]}:users", params[:user])
    render json: {user: params[:user]}, status: 200
  end

  def update_percentage
    redis_connection.set("feature:#{params[:id]}:percentage", params[:percentage])
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

end
