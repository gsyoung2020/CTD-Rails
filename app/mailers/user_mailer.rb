class UserMailer < ApplicationMailer

    def new_user_email
    @user = params[:user]

    mail(to: @user.email, subject: "New user created")
    end

end

