# frozen_string_literal: true

class Accounts::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  skip_before_action :verify_authenticity_token, only: :facebook
  #devise :omniauthable, omniauth_providers: [:facebook]

  # You should also create an action method in this controller like this:

  def facebook
    @account = Account.from_omniauth(request.env["omniauth.auth"])
    # if @account.persisted?
    sign_in_and_redirect @account #, event: :authentication 
    #   set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    # else
    #   session["devise.facebook_data"] = request.env["omniauth.auth"].except(:extra) 
    #   redirect_to new_user_registration_url
    # end
    
  end

  def auth
    request.env['omniauth.auth']
  end

  
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  def failure
    redirect_to root_path notice: "Successfully Connected †o Facebook"
  end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
