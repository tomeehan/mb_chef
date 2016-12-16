class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
   sign_in_url = tasks_path
  end

      protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password, :company) }
        end



private

def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
end

def require_login
	unless current_user
	redirect_to login_url
	end
end

end