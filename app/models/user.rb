require 'gravtastic'
class User < ActiveRecord::Base
  include Gravtastic
  is_gravtastic!
  
  #acts_as_taggable #this is for user tag browsing
  validate :check_beta_code, :on => 'create'
  validate :check_name, :on => 'create'
	
	has_and_belongs_to_many :roles
	has_many :comments
  
  # has_many :linked_accounts
  has_many :preferences
	
	has_many :posts, :dependent => :destroy
	
	# has_many :relationships,                                                     :foreign_key => 'follower_id',
							 # :dependent => :destroy
	# has_many :following, :through => :relationships, :source => :followed
	
	# has_many :reverse_relationships, :foreign_key => 'followed_id',
									 # :class_name => 'Relationship',
									 # :dependent => :destroy
									 
	# has_many :followers, :through => :reverse_relationships, :source => :follower
	
	def role?(role)
    self.role.to_sym == role.to_sym
  end
	  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
	attr_accessor :beta_code
  attr_accessible :beta_code, :email, :name, :password, :password_confirmation, :remember_me,
    :feed_preference, :karma
	
	name_regex = /\A[a-zA-Z .-]+\z/
	
	validates :name, :presence=> true,
									 :length => {:within => 5..45},
									 :format => {:with => name_regex }
	
	validates :password, :presence => true

  #for service selection
  POSSIBLE_SERVICES = ['Gravatar', 'Facebook', 'Twitter', 'Google']
#  
#  posts_upvoted_array = []
#  posts_downvoted_array = []
#  awards_array = []
#
#  comments_upvoted_array = []
#  comments_downvoted_array = []
	
	
	def check_beta_code
		beta_code_array = ['overlord']
		
		unless beta_code_array.include?(beta_code)
			errors.add(:beta_code, "Invalid Beta Code")
		end
	end
	
	def check_name
		#Add names as needed, make sure that the names you add are in all uppercase letters
		illegal_name_array = ['FRANCIS HINSON', 'MATTHEW VASSEUR', 'OFRY SHATZKY', 'NIK NAYAR']
		if illegal_name_array.include?(name.upcase)
			errors.add(:name, "Invalid Name, No Impersonation Allowed")
		end
	end
	
	# def following?(followed)
		# relationships.find_by_followed_id(followed)
	# end
	
	# def follow!(followed)
		# relationships.create!(:followed_id => followed.id)
	# end
	
	# def unfollow!(followed)
		# relationships.find_by_followed_id(followed).destroy
	# end
end
