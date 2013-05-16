class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer

  attr_accessible :upvote, :user_id, :answer_id

  #upvote is true or false - if true, vote is 1. else, vote is -1
end
