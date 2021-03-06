class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout 'simple' 


  include ApplicationHelper

  before_filter :extract_cart


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:username]
    devise_parameter_sanitizer.for(:account_update) << [:username]
  end


  def render_404
    render_optional_error_file(404)
  end

  def render_403
    render_optional_error_file(403)
  end

  def render_optional_error_file(code)
    render file: "#{Rails.root}/public/#{code}.html", status: code, layout: true
  end


      # Only permits admin users
    def require_admin!
      authenticate_user!
      
      if current_user && !current_user.admin?
        redirect_to root_path
      end
    end
    helper_method :require_admin!



end
