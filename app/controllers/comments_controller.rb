class CommentsController < ApplicationController
	
	before_action :authenticate_user!, except: [:index]


	def index 
		@posts = Post.all
		@new_post = Post.new
		@new_comment = Comment.new
	end 

	def create
		@post = Post.find(params[:post_id])
		@new_comment = @post.comments.new(params[:comment].permit(:comment))
		@new_comment.save
		redirect_to('/')
	end

end
