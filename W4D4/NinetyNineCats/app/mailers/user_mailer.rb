class UserMailer < ApplicationMailer
  default from: "everybody@appacademy.io"

  def welcome_email(user)
    @user = user
    @url  = 'http://catbnb.com/session/new'
    mail(to: user.username, subject: 'Welcome to CatBnB!')
  end
end
