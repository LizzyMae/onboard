class UsersController < ApplicationController

	def new
		#sing up form
		@user = User.new
	end


	def create
		#actually sing up to the site
		@user = User.new(user_params)
		
		if
			@user.save

			#we want to give the user a coockie to let them know who they are
			session[:user_id] = @user.id

			flash[:success] = "thanks for signing up"
			redirect_to root_path 
		else
			render "new"
		end

	end


	def user_params
		#make sure the form daa is white listed
		params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
	end
end
