# frozen_string_literal: true

class Accounts::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]


  #before_action :configure_permitted_parameters, if: :devise_controller?
  
  # # GET /resource/sign_up
  # def new
  #   super
  # end

  # # POST /resource
  # def create

  #   @account = Account.new(account_params)
  #  # @account.create!(account_params)
  #   @account.avatar.attach(params[:avatar])

  # end

  # # GET /resource/edit
  # def edit
 

  # end

  # # PUT /resource
  # def update
  #   account.update!(account_params)
  #   debugger
  #   @account = Account.find(params[:id])
  #   @account.avatar.attach(params[:avatar])

  # end

  # # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

#   protected

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:avatar ,:email, :password)}
#     devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:avatar, :email, :password, :current_password)}
#  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  # private
  #   def account_params
  #     params.require(:account).permit(:email, :password)
  #   end
end
