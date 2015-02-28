class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create     

  # render text: params
    @user = User.find_by_username params[:user][:username]

    if @user && @user.authenticate(params[:user][:password])
      flash[:success] = "Successfully logged in."
      session[:user_id] = @user.id  # sets the cookie
      redirect_to root_path         # redirect to where you want to go.
    else
      flash[:error] = "The username or password is not correct."
      render :new
    end

  end

    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: "Logged out!"
    end
  end
