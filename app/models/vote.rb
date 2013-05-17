class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer

  attr_accessible :upvote, :user_id, :answer_id



end
