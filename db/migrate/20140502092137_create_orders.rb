class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

    	#i want to associations with order
    	t.integer :room_id
    	t.integer :user_id

    	#this will be the reference on stripe. com to which credit card
    	t.string :stripe_token


      t.timestamps
    end
  end
end
