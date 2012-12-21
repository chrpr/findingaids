class User < ActiveRecord::Base
# Connects this user object to Blacklights Bookmarks. 
 include Blacklight::User
  attr_accessible :crypted_password, :current_login_at, :current_login_ip, :email, :firstname, :last_login_at, :last_login_ip, :last_request_at, :lastname, :login_count, :mobile_phone, :password_salt, :persistence_token, :refreshed_at, :session_id, :user_attributes, :username
end
