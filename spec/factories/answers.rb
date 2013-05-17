FactoryGirl.define do
  factory :answer do
    sequence(:body) { |n| "Body#{n}" }
    user
    question
  end
end
