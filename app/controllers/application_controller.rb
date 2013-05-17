class ApplicationController < ActionController::Base
  protect_from_forgery
  include VoteHelper 
  include ApplicationHelper



end
