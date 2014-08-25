class PostsController < ApplicationController

#before_action :authenticate_user!, except: [:index]

	def index
		@new_post = Post.new(params[:post].permit(:title, :content, :picture))
		@posts = Post.all
		@post = Post.find(params[:id])
		@new_comment = @post.comments.new
		render json: { posts: @posts }
	end

	def create
		@new_post = Post.new(params[:post].permit(:title, :content, :picture))
		@new_post.save 
		redirect_to('/') 
	end

	def hot
		@posts = Post.all.sort_by { |post| post.hot(post) }
	end

end
