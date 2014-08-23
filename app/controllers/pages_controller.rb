class PagesController < ApplicationController

	def index
		@posts = Post.all
		@likes = Like.all
		@dislikes = Dislike.all
		@new_post = Post.new
		@new_comment = Comment.new
	end

	def create
		@post = Post.find(params[:post_id])
		@dislike = @post.dislikes.new
		@like = @post.likes.new
		@dislike.save 
		@like.save 
		redirect_to('/') 
	end

end
