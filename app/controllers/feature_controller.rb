class FeatureController < ApplicationController

  def list
    @feature = params[:id]
    @cardinality = redis_connection.scard("feature:#{@feature}:users")
    @has_users = @cardinality > 0
    @users = redis_connection.smembers("feature:#{@feature}:users")
  end

  def new
    @percentage = 0
  end

  def report
    @users = list_users(params[:id])
    render stream: true, layout: false, content_type: "application/text"
  end

  def search
    @feature = params[:id]
  end

  def show
    @feature = params[:id]
    @percentage = redis_connection.get("feature:#{@feature}:percentage")
    @cardinality = redis_connection.scard("feature:#{@feature}:users")
    @has_users = @cardinality > 0
    @should_list = @cardinality < 100
    @users = redis_connection.smembers("feature:#{@feature}:users") if @should_list
  end

  def create
    if params[:feature].include? ":"
      flash[:error] = "Features names cannot contains \":\""
      redirect_to controller: :feature, action: :new
    else
      redis_connection.set("feature:#{params[:feature]}:percentage", 50)
      redirect_to controller: :dashboard, action: :index
    end
  end

  def add_user
    users = params[:user].split(',')
    result = redis_connection.sadd("feature:#{params[:id]}:users", users.map{ |user| user.strip })
    flash.notice = "Added '#{result}' users to feature #{params[:id]}"
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  def delete_user
    redis_connection.srem("feature:#{params[:id]}:users", params[:user])
    render json: {user: params[:user]}, status: 200
  end

  def destroy
    redis_connection.del("feature:#{params[:id]}:percentage")
    redis_connection.del("feature:#{params[:id]}:users")
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

  def update_percentage
    redis_connection.set("feature:#{params[:id]}:percentage", params[:percentage])
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  private

  def list_users(feature, pointer = 0)
     pointer, bunch = redis_connection.sscan("feature:#{feature}:users", pointer)
     bunch = bunch + list_users(feature, pointer) unless pointer.to_i.zero?
     bunch
  end

end
