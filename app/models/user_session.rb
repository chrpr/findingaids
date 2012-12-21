class UserSession < Authlogic::Session::Base
  pds_url "https://login.library.nyu.edu"
  redirect_logout_url "http://bobcat.library.nyu.edu"
  calling_system "nyu_system"
  anonymous true
end