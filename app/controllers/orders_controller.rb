class OrdersController < ApplicationController
	
	#i want to be logged in for any area of the orders section
	before_action :make_sure_logged_in

	def new
		#palce new order form
		@room = Room.find(params[:room_id])
		@order = @room.orders.new
		#to add the current user to the order
		@order.user = current_user
		#@order.starting_at = Time.now
	end


	def create
		#this will actually charge the customer
		@room = Room.find(params[:room_id])
		@order = @room.orders.new(order_params)
		@order.user = current_user

		if @order.save

			#CHARGE THEM WITH STRIPE
			Stripe::Charge.create(amount: @room.price_in_pence, currency: "gbp", card: @order.stripe_token, description: "onboard order")



			flash[:success] = "yeahhhh you've ordered this room"
			redirect_to room_path(@room)
		else
			render "new"
		end

	end



	def order_params
		#white list the form data
		params.require(:order).permit(:stripe_token)
	end

end
