class PagesController < ApplicationController
	before_filter :authenticate_user!, :except => 'jonathan', 'Command'
	
	layout :layout_by_resource
  def layout_by_resource
    if signed_in?
      'application'
		else
			'beta'
    end
  end
  
  def About
    @title = "About Us"
  end

  def Chat
render :layout => "chatLayout"
  end

  def Contact
    @title = "Contact Us"
		
		@name = 'Default'
		@email = 'example@example.com'
		@content = 'SSC is great!'
  end

  def Privacy
    @title = "Privacy Agreement"
  end

  def Terms
    @title = "Terms of Use"
  end
  def Help
    @title = "Help"
  end
  def Command
    @title = "Amazon Search Bar"
  end
  def FAQ
      @title = "FAQ"
  end
        
	
end
