class ApplicationController < ActionController::Base
  before_filter :authenticate

  protect_from_forgery
  
  protected
  def authenticate
      puts
      puts "Remote Host: #{request.headers['REMOTE_HOST']}"
      puts "Remote Addr: #{request.headers['REMOTE_ADDR']}"
      puts "Remote IP: #{request.headers['action_dispatch.remote_ip']}"
      puts
      url = request.headers['PATH_INFO']
      return true if url.end_with?('mobile') or url.end_with?"xml"
      authenticate_or_request_with_http_basic do |username, password|
        username == 'reddybathula' && password == 'SkreddyB'
      end
  end
end
