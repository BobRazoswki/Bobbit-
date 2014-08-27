class Post < ActiveRecord::Base
	has_attached_file :picture,
										styles: {thumb: "160x160#", medium: "300x300#"},
  									:storage => :s3,
							  		:s3_credentials => {
								    	:bucket => 'Bobbit',
								    	:access_key_id => Rails.application.secrets.s3_access_key_id,
								    	:secret_access_key => Rails.application.secrets.s3_secret_access_key
									  },:default_url =>  ActionController::Base.helpers.asset_path('bear.png')

	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :dislikes, dependent: :destroy

	def time_stamp
		DateTime.new(2008,9,11)
	end

	def right_price(post)
		#return post == nil || NilClass ? "no price yet" : 
		post.amount / 100
	end

	def pluralize_likes
		likes.count <= 1 ? " Like" : " Likes"
	end

	def pluralize_dislikes
		dislikes.count <= 1 ? " Dislike" : " Dislikes"
	end

	def magnitude
		likes.count + dislikes.count
	end

	def average_likes
		likes.count - dislikes.count
	end

	def balance
		dislikes.count / likes.count
	end

	def hot_expiration(post)
		post.created_at < 24.hours.ago
	end

  def hot_rank
  	Post.all.sort_by { |post| post.likes.count }
  end

  def controversy_algorythm
  	#likes.count > dislikes.count ? dislikes.count / likes.count : likes.count / dislikes.count
  end

  def rank_are_nil
  	dislikes.count <= 0 || likes.count <= 0
  end

  def controversy
   return 0 if rank_are_nil
   #controversy_algorythm
   return magnitude ** balance
  end


end
