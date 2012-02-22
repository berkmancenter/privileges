class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private 
  def authenticate_admin!
    if !current_user.try(:admin?)
      redirect_to(root_url)
    end  
    
  end
end
