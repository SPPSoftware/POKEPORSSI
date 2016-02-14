class SessionsController < ApplicationController
  layout 'login_layout'
  def new
  end

  def create
    @user = User.find_by_username(params[:session][:username])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to '/'
      else
        render action: 'new', alert: "Väärät tunnukset"
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
