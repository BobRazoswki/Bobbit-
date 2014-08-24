class PostsController < ApplicationController

before_action :authenticate_user!, except: [:index]

	def index
		@new_post = Post.new(params[:post].permit(:title, :content, :picture))
		@posts = Post.all
		render json: { posts: @posts }
	end

	def create
		@new_post = Post.new(params[:post].permit(:title, :content, :picture))
		@new_post.save 
		redirect_to('/') 
	end


end
