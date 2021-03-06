class UsersController < ApplicationController
  def login_screen
    @page_title = 'Property repossession'
    render 'login', :layout => 'application-claims'
  end

  def create_session
    author = Author::Proxy.new(Rails.application.config.auth_client)
    
    begin
      if(author.login(params[:email], params[:password]))
        write_secure_token author.session
      else
        flash_alert "Authentication failed."
      end
    rescue Errno::ECONNREFUSED => e
      flash_alert "Auth service not responding."
    end
    
    redirect_to controller: 'claims', action: 'landing' 
  end

  def logout
    reset_session
    redirect_to controller: 'users', action: 'login_screen'
  end
end
