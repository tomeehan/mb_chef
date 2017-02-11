 SessionsTitlesController::SessionsController < Devise::SessionsController 

	 def new
	    @title = "Mysite is so great and here is where you sign in!"
	 end
 end