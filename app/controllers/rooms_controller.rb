class RoomsController < ApplicationController


	#i want to a check before certain actions happen
	before_action :make_sure_logged_in, only: [:new, :create, :edit, :update, :destroy]

	def index
		#this is the homepage
		@rooms = Room.all
	end




	def show
		#this is an individual room
		@room = Room.find(params[:id])
	end




	def new 
		#add a new room
		@room = current_user.rooms.new
	end









	def create
		#actually add the room to database
		@room = current_user.rooms.new(room_params)

		if  @room.save
			flash[:success] = "you've added this room"
			redirect_to room_path(@room)

		else
			render "new"
		end
	end









	def edit
		#a form for editing the room
		@room = current_user.rooms.find(params[:id])
	end








	def update
		#it will actually edit it
		@room = current_user.rooms.find(params[:id])
		
		if @room.update(room_params)
			flash[:success] = "you've updated this room"
			redirect_to room_path(@room)
		else	
			render "edit"
		end
	end


	def destroy
		#actually delete form the database
		@room = current_user.rooms.find(params[:id])

		@room.destroy
		flash[:success] = "room has been deleted :("

		redirect_to root_path

	end







	def room_params
		#make sure the form data isnt hacked
		params.require(:room).permit(:name, :address, :description, :number_of_guests, :image )
	end




end
