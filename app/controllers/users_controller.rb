class UsersController < ApplicationController

	def my_profile
		@user = current_user
	end 

	def my_friends
		@friendships = current_user.friends
		@users = User.search(params[:search_param])
		#@search_params = params[:search_params]
		if @users
			@users = current_user.except_current_user(@users)
		end 
	end 

	def show 
		@user = User.find(params[:id])
	end 

	def search 
		@users = User.search(params[:search_param])
		#@search_params = params[:search_params]
		if @users
			@users = current_user.except_current_user(@users)
		end 

	end 

	def add_friend
		@friend = User.find(params[:friend])
		#binding.pry
		current_user.friendships.build(friend_id: @friend.id)
		#current_user.relationships 
		# implies the association of the current_user has many relationships 
		#current_user.relationships.build 
		# .build is a method to populate a new object that can be save as a new record
		# means you will create a new relationship record by populating the user_id 
		# column with the current_user.id and the followed_id with the target @user.id

		if current_user.save 
			redirect_to 'my_friends_path', notice: "Friend added"
		else
			redirect_to 'my_friends_path', flash[:error]
		end 
	end 
end 