class UsersController < ApplicationController

	before_action :require_signin, except: [:new, :create]
	before_action :require_correct_user, only: [:edit, :update, :destroy]

	def index
		@users = User.all
  end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	  end
	
	def create
	  @user = User.new(user_params)

	  if @user.save
		UserMailer.with(user: @user).welcome_email.deliver_later
		session[:user_id] = @user.id 
		  redirect_to @user, notice: "Thanks for signing up!"
		else
		   render :new
		end
	end

	def edit
	end

	def update
	  if @user.update(user_params)
		   redirect_to @user, notice: "Account succesfully updated!"
		 else
		   render :edit
		end
	end

	def destroy
		@user.destroy
		redirect_to events_url, alert: "Account succesfully deleted"
		session[:user_id] = nil
	end


private

  def require_correct_user
	@user = User.find(params[:id])
	  redirect_to events_url unless current_user?(@user)
  end
	
  def user_params
	params.require(:user).
	 permit(:name, :email, :password, :password_confirmation)
  end
	
	
	
	
end
	




