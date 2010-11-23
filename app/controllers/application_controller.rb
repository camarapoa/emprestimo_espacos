# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
	
  helper :all # include all helpers, all the time
  helper_method :operador?, :back_path_or
  before_filter :init, :store_location
  

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
	def init
    headers['Content-Type'] = request.xhr? ? "text/javascript; charset=utf-8" : "text/html; charset=utf-8"
    WIN32OLE.codepage = WIN32OLE::CP_UTF8
  end
  
	def store_location
    if request.request_method == :get && session[:last] != request.request_uri
      session[:back_path] = session[:last]
      session[:last] = request.request_uri
    end
  end
  
  def back_path_or(default)
    session[:back_path] || default
  end  
  
end
