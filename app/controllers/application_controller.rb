class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
	include CurrentUserConcern

	rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden }
        format.html { redirect_back fallback_location: '/', allow_other_host: false, :alert => exception.message }
        #format.html { redirect_to main_app.root_url, :alert => exception.message }
      end
    end

    def after_sign_in_path_for(resource)
      opportunities_path
    end
    
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :carrier, :firstname, :lastname])
  end
end
