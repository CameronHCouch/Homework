class SessionsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		email = params[:user][:email]
		password = params[:user][:password]
		@user = User.find_by_credentials(email, password)
		if @user
			login!(@user)
			redirect_to bands_url
		else
			flash.now[:errors] = ["Wrong login info, music-friend."]
			render :new
		end
	end

	def destroy
		logout!
		redirect_to new_session_url
	end

end
