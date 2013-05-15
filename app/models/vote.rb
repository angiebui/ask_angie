class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer

  attr_accessible :upvote

  #upvote is true or false - if true, vote is 1. else, vote is -1
end
