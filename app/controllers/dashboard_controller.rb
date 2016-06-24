class DashboardController < ApplicationController

  def index
    @redis = redis_connection
  end

end
