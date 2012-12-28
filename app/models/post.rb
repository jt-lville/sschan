 class Post < ActiveRecord::Base

  has_attached_file :upload, :styles => { :medium => "200x200#", :thumb => "100x100#" },
    :default_url => "/images/:style/missing.png",
      :storage => :s3,
      :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
      :bucket => 'sschan'
      #:path => ":attachment/:id/:style.:extension",
    #:path => "/images/uploads/", :url => "/images/uploads/:style/:post_id.:extension" #uploads

	#validates_with AttachmentSizeValidator, :attributes => :upload

	#validates_attachment :upload,
  	  #:content_type => { :content_type => "image/jpg" },
  	 # :size => { :in => 0..1.megabytes }

	#validates_attachment_size :in => 0..1.megabytes 

	 # don't resize audio or other non-image media
	 before_post_process :skip_for_non_image

  def skip_for_non_image
    #! %w(application/x-shockwave-flash text/plain text/html audio/ogg application/ogg audio/mp4 audio/mpeg audio/mp3 application/mp3).include?(upload_content_type)
	%w(image/jpeg image/pjpeg image/gif image/png image/x-png image/jpg).include?(upload_content_type)
  end


	validates_attachment_size :upload, :less_than => 7.megabytes
                         
	acts_as_taggable

        is_impressionable ##for viewing

	belongs_to :user

	has_many :comments, :dependent => :destroy
	validates :title, :length => {:within => 0..150}#, Jon: removed the title regex
									  #:format => {:with => title_regex }

	validates :content, :length => {:within => 0..2000}
                    
#   validates :post_location, :presence => true                                                       #   
#   validates :user_location, :presence => true
#   
#   validates :source, :presence => true

	attr_accessor :politics, :tech, :entertainment, :sports, :science, :crime, :business, :social, :nature, :other
  
	attr_accessible :name, :title, :content, :user_location, :post_location, :user_id,
    :post_id, :karma, :trending_value, :pageviews, :accuracy, :inaccuracy,   # <-- Jon's super code
    :total_votes, :time_effective, :accuracy_ratio, :accuracy_percent, :source, :alias, :upload,

     :upload_file_name, :upload_content_type, :upload_file_size,
                  :upload_updated_at
     
     	
end
