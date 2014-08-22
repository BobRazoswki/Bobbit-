class Post < ActiveRecord::Base
		has_attached_file :picture,
							styles: {thumb: "100x100#", medium: "300x300#"},
  									:storage => :s3,
							  		:s3_credentials => {
								    	:bucket => 'Bobbit',
								    	:access_key_id => Rails.application.secrets.s3_access_key_id,
								    	:secret_access_key => Rails.application.secrets.s3_secret_access_key
									  }

	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/




	has_many :likes


	def pluralize_likes
		likes.count <= 1 ? " Like" : " Likes"
	end


end
