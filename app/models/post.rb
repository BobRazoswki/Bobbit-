class Post < ActiveRecord::Base
		has_attached_file :picture,
							styles: {thumb: "160x160#", medium: "300x300#"},
  									:storage => :s3,
							  		:s3_credentials => {
								    	:bucket => 'Bobbit',
								    	:access_key_id => Rails.application.secrets.s3_access_key_id,
								    	:secret_access_key => Rails.application.secrets.s3_secret_access_key
									  }

	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

	has_many :comments
	has_many :likes
	has_many :dislikes


	def pluralize_likes
		likes.count <= 1 ? " Like" : " Likes"
	end

	def pluralize_dislikes
		dislikes.count <= 1 ? " Dislike" : " Dislikes"
	end

	def average_likes
		likes.count - dislikes.count
	end


	  def time_count
  	base_time = DateTime.new(2005, 12, 8, 07, 46, 43)
  	created_at.to_f - base_time.to_f
  end

  def hot_rank
  	return 0 if average_likes <= 0
  	 (Math.log10(average_likes)+(time_count/45000))
  end



	def ratio_likes_by_dislikes
		post.likes.count / post.dislikes.count
	end

	def ratio_rating_by_posts
		(@dislikes.count + @likes.count) / @posts.count
	end

end
