class CommentsController < ApplicationController
	
	before_action :authenticate_user!, except: [:index]

	def create
		@post = Post.find(params[:post_id])
		@new_comment = @post.comments.new(params[:comment].permit(:comment))
		@new_comment.save
		redirect_to post_path(@post)
	end

end
