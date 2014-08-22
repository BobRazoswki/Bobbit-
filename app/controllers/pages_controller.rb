class PagesController < ApplicationController

	def index
		@posts = Post.all
		@new_post = Post.new
		@new_comment = Comment.new
	end

	def create
		@post = Post.find(params[:post_id])
		@like = @post.likes.new
		@like.save 
		redirect_to('/') 
	end

end
