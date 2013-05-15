FactoryGirl.define do
  factory :question do
    sequence(:title) { |n| "Title#{n}" }
    body "Bodybody body"
    sequence(:user_id) { |n| n }
  end


end
