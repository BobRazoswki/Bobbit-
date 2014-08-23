class LikesController < ApplicationController

	before_action :authenticate_user!, except: [:index]
def index
	redirect_to('/users/sign_up')
end
	def create
		@new_post = Post.find(params[:post_id])
		@new_post.likes.create
		render json: { new_like_count: @new_post.likes.count, new_sentence: @new_post.pluralize_likes }
	end 

end
