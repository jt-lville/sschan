class ApplicationController < ActionController::Base
  protect_from_forgery

    before_filter :prepare_for_mobile

  private
  
  def current_preference
  Preference.find(session[:preference_id])
    
  rescue ActiveRecord::RecordNotFound
    @preference = Preference.create
    session[:preference_id] = @preference.id
    @preference
    
  end
	
	def after_sign_in_path_for(resource)
		posts_path
	end

def mobile_device?
  if session[:mobile_param]
    session[:mobile_param] == "1"
  else
    request.user_agent =~ /Mobile|webOS/ #customize according to user agent strings
  end
end
helper_method :mobile_device?

def prepare_for_mobile
  session[:mobile_param] = params[:mobile] if params[:mobile]
  #request.format = :mobile if mobile_device?
end

end