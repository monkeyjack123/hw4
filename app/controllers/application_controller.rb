class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    if session["user_id"]
      @current_user = User.find_by({ "id" => session["user_id"] })
    else
      @current_user = nil
    end
  end

  def require_login
    if @current_user == nil
      redirect_to "/login"
    end
  end
  
end