class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    if current_user.account_completed?
      redirect_to root_path
    else
      redirect_to new_registration_car_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end