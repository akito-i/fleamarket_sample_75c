class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:given_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:given_name_kana])
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday])
  end

  private
  

  def production?
    Rails.env.production?
  end
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end
  
end
