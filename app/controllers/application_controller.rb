class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

  def after_sign_in_path_for(resource)
      if current_user
        flash[:notice] = "Welcome!! You loged in successfully!!" 
        user_path(resource.id)
      else
        flash[:notice] = "Welcome!! You signed up successfully!!" 
        user_path(resource.id)
      end
  end
  
  def after_sign_out_path_for(resource)
        flash[:notice] = "Signed out successfully."
  		  root_path
  end

 end
