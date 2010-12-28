class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  
  def request_from_facebook?
    !!(request.referrer.match(APP_URL)) && FacebookSignedRequest.valid?(params[:signed_request])
  end

  def fbclient
    @fbclient ||= FBGraph::Client.new(:client_id => APP_ID, :secret_id => APP_SECRET, :token => session[:access_token])
  end
end
