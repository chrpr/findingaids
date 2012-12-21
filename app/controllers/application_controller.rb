class ApplicationController < ActionController::Base
  require 'authpds'
  include Authpds::Controllers::AuthpdsController
  
  # Adds a few additional behaviors into the application controller 
  include Blacklight::Controller
  # Please be sure to impelement current_user and user_session. Blacklight depends on 
  # these methods in order to perform user specific actions. 

  layout 'bobcat'

  protect_from_forgery
  
end
