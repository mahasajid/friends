require "prawn"
class ApplicationController < ActionController::Base

    def current_user
        current_account
    end

#   def current_ability
#     @current_ability or @current_ability = Ability.new(current_account)
#   end
end
