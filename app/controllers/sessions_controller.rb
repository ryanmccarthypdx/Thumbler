class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.authenticate(params[:name], params[:password])
    if @user
      flash[:notice] = "Thumbs up!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "Thumbs down! There was a problem logging you in"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logout successful!"
    redirect_to "/"
  end

end
