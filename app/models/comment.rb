class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  has_attached_file :file, :styles => { :medium => "200x200#", :thumb => "100x100#" },
    :default_url => "/images/:style/missing.png",
      :storage => :s3,
      :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
      :bucket => 'sschan'
    
	 # don't resize audio or other non-image media
	 before_post_process :skip_for_non_image

  def skip_for_non_image
    #! %w(application/x-shockwave-flash text/plain text/html audio/ogg application/ogg audio/mp4 audio/mpeg audio/mp3 application/mp3).include?(upload_content_type)
	%w(image/jpeg image/pjpeg image/gif image/png image/x-png image/jpg).include?(file_content_type)
  end
	validates_attachment_size :file, :less_than => 12.megabytes
	

  #nesting, experimental vvv
#
 # has_many :comments
  #belongs_to :comments
  
  #acts_as_nested_set
 # accepts_nested_attributes_for :comments
  
  #acts_as_rateable #This is for voting
	
	#comment_regex = /\A[a-zA-Z.\:\;, \/\'\"\(\)\{\}\[\]]+\z/
	
	
	#validates :content, :length => {:within => 10..2000}#,
	                     #:format => {:with => comment_regex}
                       
 #attr_accessible :points_up, :points_down
  

end
