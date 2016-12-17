class PagesController < ApplicationController

	def home
		if user_signed_in?
			redirect_to tasks_path
			# TODO replace this with https://github.com/plataformatec/devise/wiki/How-To:-redirect-to-a-specific-page-on-successful-sign-in
		end
	end

	def about
	end

	def pricing
	end

	def enterprise
	end

	def privacy
	end

	def team
	end

end
