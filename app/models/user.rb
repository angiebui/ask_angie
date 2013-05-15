class User < ActiveRecord::Base
  has_many :questions
  has_many :votes
  has_many :answers

  attr_accessible :username, :email
end
