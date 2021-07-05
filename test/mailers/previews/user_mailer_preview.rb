# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

def new_user_email
    #a temp email preview
    user = User.new(username: "gy", email: "asagy@gmail.com")

    UserMailer.with(user: user).new_user_email
end
end
