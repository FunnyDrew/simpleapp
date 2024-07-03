class ApplicationController < ActionController::Base
  def get_hi
    'Hi'
  end

  helper_method :get_hi
end
