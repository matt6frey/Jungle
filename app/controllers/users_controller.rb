class UsersController < ApplicationController
  def new
  end


  def create
    user = User.new(user_params)
    stored_users = User.all
    found = false
    stored_users.each { |stored_user|
      if user_params[:email] == stored_user.email
        found = true
      end
    }
    if user.save && !found
      session[:user_id] = user.id
      @current_user = session[:user_id]
      redirect_to '/'
    else
      redirect_to '/signup', notice: "Sign Up failed."
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
