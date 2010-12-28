class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  
  def request_from_facebook?
    !!(request.referrer.match(APP_URL)) && FacebookSignedRequest.valid?(params[:signed_request])
  end
end
