class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
	before_action :authenticate_user!, except: [:index,:show]

	def index 
	end 
	
	def profile
		@posts = Post.all.order("created_at DESC")
	end 

	def show 
	end 

	def new
		@post = current_user.posts.build
	end 

	def create
		@post = current_user.posts.build(post_params)
		#current_user.relationships 
		# implies the association of the current_user has many relationships 
    #current_user.relationships.build 
		# .build is a method to populate a new object that can be save as a new record
		# means you will create a new relationship record by populating the user_id 
		# column with the current_user.id and the followed_id with the target @user.id
		if @post.save
			redirect_to @post, notice: "Post was succesfully created"
			#redirect to @post ie th post show pages
		else
			render 'new'
		end 

	end 

	def edit 
	end 

	def update
		if @post.update(post_params)
			redirect_to @post, notice: "Post was succesfully updated"
		else 
			render 'edit'
		end 
	end 

	def destroy
		@post.destroy
		redirect_to root_path
	end 

	def upvote 
		@post.upvote_by current_user
		redirect_to :back
	end 

	private 

	def post_params
		params.require(:post).permit(:title,:description, :image)
	end 

	def find_post
		@post = Post.find(params[:id])
	end 

end
