class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  #nesting, experimental vvv
#
  has_many :comments
  belongs_to :comments
  
  acts_as_nested_set
  accepts_nested_attributes_for :comments
  
  #acts_as_rateable #This is for voting
	
	#comment_regex = /\A[a-zA-Z.\:\;, \/\'\"\(\)\{\}\[\]]+\z/
	
	
	validates :content, :presence => true,
	                    :length => {:within => 3..400}#,
	                     #:format => {:with => comment_regex}
                       
 #attr_accessible :points_up, :points_down
  

end