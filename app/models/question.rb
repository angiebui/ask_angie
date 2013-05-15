class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers 

  attr_accessible :body, :title
end
