FactoryGirl.define do
  factory :question do
    sequence(:title) { |n| "Title#{n}" }
    body "Question Body"
    user
    topic
  end
end
