class Ability
  include CanCan::Ability

  def initialize(user)
	
	new = false
	if (user == nil)
		user = User.new
		new = true
	end
	
	#user ||= User.new # guest user (not logged in)

	# if user.role == "admin"
	# if user.role? :admin

	# hacky adminship
       if user.email == "kyothine@gmail.com"
         can :manage, :all
       else
	can :manage, Post, :user_id => user.id
	can :manage, Comment, :user_id => user.id

        can :read, :all
	can :create, :all
	can :new, :all
	end

	# a bit hacky...shhhh
	if new
		can :manage, User
	end

   end
end
