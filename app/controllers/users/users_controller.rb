class UsersController < ApplicationController

	def my_profile
		@user = current_user
	end 

	def my_friends
	end 
end 