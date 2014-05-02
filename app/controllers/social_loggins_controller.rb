class SocialLoginsController < ApplicationController

	#we want to handle log in or sign up with social networks
	def create


		#get data from the omniauth that returns back
		@data = request.env["omniauth.auth"]


		#this is data from omniauth
		@provider = @data["provider"]
		@provider_id = @data["uid"]

		#are there anyusers on the site that have this provider and provider id
		@users = User.where(provider: @provider, provider_id: @provider_id)

		if 	@users.any?
			#sing in as the first user we have in the list
			@user = @users.first
			session[:user_id] = @user.id
			flash[:success] = "u are logged in"
			redirect_to root_path

		else
			#make a user with the deatails from omniauth
			@user = User.new

			#fill in the provider details
			@user.provider = @provider
			@user.provider_id = @provider_id

			#lets get the users info form omnioth
			@user.name = @data["info"]["name"]
			@user.username = @data["info"]["nickname"]
			@user.email = @data["info"]["email"]

			#lets fill in the users password
			@user.password = "qwerty123098"
			@user.password_confirmation = "qwerty123098"

			#lets save the details for the providers api
			@user.key = @data["credentials"]["token"]
			@user.secret = @data["credentials"]["secret"]

			@user.save!

			session[:user_id] = @user.id
			flash[:success] = "you are now signed up to onboard"
			redirect_to root_path
		and


	end

end
