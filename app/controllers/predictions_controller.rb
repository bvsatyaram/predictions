class PredictionsController < ApplicationController
  skip_before_filter :verify_authenticity_token if :request_from_facebook?
  
  def predict
    @prediction = Prediction.first(:order => 'RANDOM()')
  end
end
