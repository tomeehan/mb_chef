class PagesController < ApplicationController

	def home
		if user_signed_in?
			redirect_to tasks_path
			# TODO replace this with https://github.com/plataformatec/devise/wiki/How-To:-redirect-to-a-specific-page-on-successful-sign-in
		end
		@title = "Minibarra Chef | Chefs Paperwork Made Simple"
	end

	def about
		@title = "About | Minibarra Chef"
	end

	def pricing
		@title = "Pricing & Plans | Minibarra Chef"
	end

	def enterprise
		@title = "Enterprise | Minibarra Chef"
	end

	def privacy
		@title = "Privacy Policy | Minibarra Chef"
	end

	def team
		@title = "Meet the team | Minibarra Chef"
	end

	def features
		@title = "Features | Minibarra Chef"
	end

	def time
		@title = "Time | Minibarra Chef"
	end

	def support 
		@title = "Support | Minibarra Chef"
	end

end
