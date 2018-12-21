class UsersController < ApplicationController
  def new  # create 'dummy' User object (all users r dummies tho)
    @user = User.new
    render :new
  end

  def create # make a new user, if the user is valid, login & redirect to main page
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to bands_url
    else
      # show all of user's many errors & render new
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show #if a user is logged_in, we can see their 'profile' page (assuming it has been created)
    if logged_in?
      render :show
    else
      flash.now[:errors] = ['You have to be logged in to do that.']
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
