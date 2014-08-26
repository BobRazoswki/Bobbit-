class DislikesController < ApplicationController

	before_action :authenticate_user!, except: [:index]

	def create
		@new_post = Post.find(params[:post_id]).dislikes.create
		render json: { new_dislike_count: @new_post.dislikes.count, new_sentence: @new_post.pluralize_dislikes }
	end 

end
