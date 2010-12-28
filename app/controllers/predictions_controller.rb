class PredictionsController < ApplicationController
  skip_before_filter :verify_authenticity_token if :request_from_facebook?
  
  def predict
    @prediction = Prediction.first(:order => 'RANDOM()')
    publish_prediction_to_wall
  end

  protected

  def publish_prediction_to_wall
    begin
      fbclient.selection.me.feed.publish!(
        :message => "Lol! This is great :-D " + "at" + Time.now.strftime("%b %d %l:%M:%S %p"),
        :name => "Predictions for the year 2011",
        :description => @prediction.full_description,
        :link => APP_URL,
        :picture => LOGO_URL,
        :actions => "{'name': 'Get my prediction', 'link': '#{APP_URL}'}"
      )
    rescue
      nil
    end
  end
end
