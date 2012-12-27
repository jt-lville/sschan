class Users::RegistrationsController < Devise::RegistrationsController
	layout  "beta"
	
	def create
		build_resource

    if resource.save
			redirect_to '/login'
			
      #sign_in_and_redirect(resource_name, resource)
      
      #this commented line is responsible for sign in and redirection
      #change to something you want..
      
      # redirect_to '/posts'
      
    else
      clean_up_passwords(resource)
      render_with_scope :new
      flash[:notice] = "Error: Failed to register user."
      
    end
end
	
end
