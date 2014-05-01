class SessionsController < ApplicationController




	def new
		#sign up form no need for any variables bacuse we are not adding anything to the database

	end


	def create
		#instructions 
		#lets get username and password form the form
		#lets see if there is a user with that username
		#if there is and the password matches then log in
		#if not then show and error

		@username = params[:session][:username]
		@password = params[:session][:password]

		@user = User.find_by_username(@username)

		if 
			@user.present? and @user.authenticate(@password)
			#to log in give them a session
			session[:user_id] = @user.id
			flash[:success] = "yeahhhhh welcome back, #{@user.name}"
			redirect_to root_path
		else
			flash[:error] = "log in failed"
			render "new"
		end
	end

	def destroy
		#logout
		reset_session
		flash[:session] = "you are logged out"
		redirect_to root_path
	end
end
