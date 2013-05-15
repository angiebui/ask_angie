class Answer < ActiveRecord::Base
  belongs_to :user
  has_many :votes

  attr_accessible :body
end
