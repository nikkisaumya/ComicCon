class Users::SessionsController < Devise::SessionsController

	protected

	def after_sign_in_path_for resource
		"/pins/#{current_user.id}/profile"
	end
end