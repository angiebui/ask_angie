class ApplicationController < ActionController::Base
  protect_from_forgery
  # REVIEW: good approach, but now you're mixing view helpers with controller helpers.
  # I would move this into a module under lib/ and not polute the ApplicationHelper.
  include ApplicationHelper

end
