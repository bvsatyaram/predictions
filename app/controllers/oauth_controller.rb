class OauthController < ApplicationController
  skip_before_filter :verify_authenticity_token if :request_from_facebook?
  
  def authorize
    redirect_to (APP_URL + "predictions/predict") if session[:access_token]
    @reauthorize = (params[:authorized] == "false")
    @authorization_url = oclient.web_server.authorize_url(:redirect_uri => oauth_callback_url, :scope => 'publish_stream')
  end

  def callback
    if params[:error]
      redirect_to (APP_URL + "oauth/authorize?authorized=false")
    else
      oauth_response = oclient.web_server.get_access_token(params[:code], :redirect_uri => oauth_callback_url)
      session[:access_token] = oauth_response.token
      redirect_to (APP_URL + "predictions/predict")
    end
  end

  protected

  def oclient
    @oclient ||= OAuth2::Client.new(APP_ID, APP_SECRET, :site => GRAPH_URL)
  end
end
