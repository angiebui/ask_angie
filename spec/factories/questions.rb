FactoryGirl.define do
  factory :question do
    sequence(:title) { |n| "Title#{n}" }
    body "Question Body"
    sequence(:user_id) { |n| n }
  end
end
