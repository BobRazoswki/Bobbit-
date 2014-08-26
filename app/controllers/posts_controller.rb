class PostsController < ApplicationController

before_action :authenticate_user!, except: [:index]
#before_action :signed_in_user, only: [ :index, :create, :hot]
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

	def hot
		@new_comment = Comment.new
		@posts = Post.all.sort_by { |post| post.hot_rank }
	end

	def controversial
		@new_comment = Comment.new
		@posts = Post.all.sort_by { |post| post.controversy }
	end
	
	def show
		redirect_to('/') 
	end

end
