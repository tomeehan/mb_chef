class SubscribersController < ApplicationController

	before_filter :authenticate_user!

	def new
	end

	def update
		token = params[:stripeToken]

		customer = Stripe::Customer.create(
			card: token, 
			plan: current_user.plan,
			email: current_user.email
			)

		current_user.subscribed = true 
		current_user.stripe_id = customer.id
		current_user.save!

		redirect_to staffs_path
	end
end