class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



  before_action :authenticate_user!

  # Redirection si user n'est pas permis
  rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden, content_type: 'text/html' }
        format.html { redirect_to main_app.root_url, notice: exception.message }
        format.js   { head :forbidden, content_type: 'text/html' }
      end
    end


    # pour ajouter un champ dans le formulaire user
     before_action :configure_permitted_parameters, if: :devise_controller?

  	protected
  		def configure_permitted_parameters
  		  devise_parameter_sanitizer.permit(:sign_up, keys: [:surname,:name, :email, :password, :password_confirmation ])
  		  devise_parameter_sanitizer.permit(:account_update, keys: [:surname,:name, :email, :password, :password_confirmation, :profil,:current_password])
  		end
end
