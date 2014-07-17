class UsersController < ApplicationController
	before_action :signed_in_user, only: [:edit, :update, :destroy]
  	before_action :correct_user,   only: [:edit, :update]
  	#before_action :admin_user1,     only: [:destroy, :index]
	
	def index
		@users=User.all
	end

	def new
	 	@user=User.new
	end

	def create
		@user=User.new(user_params)
		if @user.save
			sign_in @user
			flash[:success] = 'Welcome to the Document Update Page'
			redirect_to users_url #Will go different ways depending on rights
		else
			render 'new'
		end
	end

	def show
		@user=User.find(params[:id])
	end

	def edit
		@user= User.find(params[:id])
  	end

  	def update
    	if @user.update_attributes(user_params)
      		flash[:success] = "Profile updated"
      		redirect_to @user
    	else
      		render 'edit'
    	end
  	end

	
	private

		def user_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin2 )
		end

		def signed_in_user
      		unless signed_in?
        		store_location
        	redirect_to signin_url, notice: "Please sign in."
      		end
    	end

    	def correct_user
      		@user = User.find(params[:id])
      			#checks to see if the requesting user is the current user
      		redirect_to(root_url) unless current_user?(@user)
    	end

    	


end
