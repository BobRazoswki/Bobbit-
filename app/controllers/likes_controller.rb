class LikesController < ApplicationController

	before_action :authenticate_user!, except: [:index]

	def create
		@new_post = Post.find(params[:post_id]).likes.create
		render json: { new_like_count: @new_post.likes.count, new_sentence: @new_post.pluralize_likes }
	end 

end
