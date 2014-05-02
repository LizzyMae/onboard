class OrderMailer < ActionMailer::Base
  default from: "lizzy@onboard.com"


  #the bit that says order will put in which order we want to send
  def new_order_notification(order)


  	#make the order available to the view (coz we cant use order since we use it in ruby)
  	@order = order 
  	@room = @order.room
  	@user = @order.user
  	@owner = @room.user


  	mail to: @owner.email, subject: "you have a new order", cc: "l_mvanson@hotmail.com"


  end

  #def credit_card_failed




end
