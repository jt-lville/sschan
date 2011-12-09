 class Post < ActiveRecord::Base
    
	acts_as_taggable
    #experimental:
 # acts_as_nested_set
  
	#acts_as_taggable_on :tags
  #acts_as_rateable #this is for voting
  is_impressionable ##for viewing

	belongs_to :user

	has_many :comments, :dependent => :destroy
	
	#has_many :votes, :as => :voteable
	#has_many :voting_users,
	#		 :through => :votes,
	#		 :source => :user	

#	validates :name, :presence => true #commented out for experimental reasons: if it fails, uncomment it

	validates :title, :length => {:within => 5..150}#, Jon: removed the title regex
									  #:format => {:with => title_regex }

	validates :content,:uniqueness => true, :length => {:within => 10..900}
                    
#   validates :post_location, :presence => true                                                                    

#   
#   validates :user_location, :presence => true
#   
#   validates :source, :presence => true

	attr_accessor :politics, :tech, :entertainment, :sports, :science, :crime, :business, :social, :nature, :other
	attr_accessible :name, :title, :content, :user_location, :post_location, :user_id,
    :post_id, :karma, :trending_value, :pageviews, :accuracy, :inaccuracy,   # <-- Jon's super code
    :total_votes, :time_effective, :accuracy_ratio, :accuracy_percent, :source, :alias
     
     	
end
