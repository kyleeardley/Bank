module CurrentUser
	extend ActiveSupport::Concern

	private
	def set_current_user
		remember_token = User.digest(cookies[:remember_token])
    	@current_user= User.find_by(remember_token: remember_token)
	end
end