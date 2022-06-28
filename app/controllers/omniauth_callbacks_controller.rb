class OmniauthCallbacksController < ApplicationController
	def facebook
        render plain Success
		# @user = User.from_omniauth(request.env["omniauth.auth"])
		# sign_in_and_redirect @user
	end
end