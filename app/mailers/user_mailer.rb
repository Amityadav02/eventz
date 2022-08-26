class UserMailer < ApplicationMailer
   
  def welcome_email
		@user = params[:user]
		@url  = 'http://http://localhost:3000/session/new'
		mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
