class Topic < ActiveRecord::Base
  has_many :questions
  attr_accessible :title 
end