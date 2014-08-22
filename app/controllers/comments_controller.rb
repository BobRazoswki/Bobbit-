class CommentsController < ApplicationController

	def index 
		@comments = Comment.all
		@new_comment = Comment.new
	end 

	def create
		
	end

end
