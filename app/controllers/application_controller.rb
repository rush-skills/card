class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # require SecureRandom
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, unless: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)  { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me, :contact_number, :address, :job_title, :job_company, :education_degree, :education_college,:website,:dob,:bio,:location,:pic,:github,:gplus,:linkedin,:facebook, :twitter) }
    devise_parameter_sanitizer.for(:account_update)  { |u| u.permit(:name, :email, :current_password, :password, :password_confirmation, :remember_me, :contact_number, :address, :job_title, :job_company, :education_degree, :education_college,:website,:dob,:bio,:location,:pic,:github,:gplus,:linkedin,:facebook, :twitter) }
  end


  def after_sign_in_path_for(resource)
    # return the path based on resource
    "/"
  end
  def after_sign_up_path_for(resource)
    # return the path based on resource
    "/"
  end

end
