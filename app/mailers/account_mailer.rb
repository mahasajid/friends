class AccountMailer < ApplicationMailer


    def new_friend_email
        @friend = params[:friend]
        @account = params[:account]    
        mail(to: @friend.email, subject: "You were added as a friend by #{@account.email}")
    end
    
end
