class Prediction < ActiveRecord::Base
  def full_description
    "You " + description
  end
end
