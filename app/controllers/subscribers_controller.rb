class SubscribersController < ApplicationController

	before_filter :authenticate_user!

	def new
	end

	def update
		token = params[:stripeToken]

		customer = Stripe::Customer.create(
			card: token, 
			plan: 1020,
			email: current_user.email
			)

		current_user.subscribed = true 
		current_user.stripe_id = customer.id
		current_user.save

		redirect_to ticks_path
	end
end