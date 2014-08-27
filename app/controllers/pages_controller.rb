class PagesController < ApplicationController
before_action :authenticate_user!, except: [:index]
	def index
		@posts = Post.all
		@likes = Like.all
		@dislikes = Dislike.all
		@new_post = Post.new
		@new_comment = Comment.new
	end

end
