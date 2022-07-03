require "prawn"
class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    def current_user
        current_account
    end

#   def current_ability
#     @current_ability or @current_ability = Ability.new(current_account)
#   end
protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :avatar)}
  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password, :password_confirmation, :avatar)}
end

end