class ApplicationController < ActionController::Base
  before_filter :authenticate

  protect_from_forgery
  
  protected
  def authenticate
      url = request.headers['PATH_INFO']
      return true if url.end_with?('mobile') or url.end_with?"xml"
      authenticate_or_request_with_http_basic do |username, password|
        username == 'reddybathula' && password == 'SkreddyB'
      end
  end
end
