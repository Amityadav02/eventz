class UserMailer < ApplicationMailer
	default from: 'Amit@gmail.com'
      
  def welcome_email
	byebug
		@user = params[:user]
		@url  = 'http://health.com/login'
		mail(to: @user.email, subject: 'Welcome to My Awesome Site')
	end
end
