class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :signed_in?, :sign_out!

  protected
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  
  def signed_in?
    !!current_user
  end
  
  def sign_out!
    session.delete :user_id
  end
  
  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end
  
  def auth_twitter(user)
    logger.warn ENV['HOGE']
    Twitter.configure do |config|
      config.consumer_key       = 'nDMuBzbv5vBv07JHLLzg'
      config.consumer_secret    = 'gxyJGlQkvQy93xRWu5oDlsClafXk6eR8YCfM3zwn8'
      config.oauth_token        = user.access_token
      config.oauth_token_secret = user.access_secret
    end
  end
end
