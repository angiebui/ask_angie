FactoryGirl.define do
  factory :answer do
    sequence(:body) { |n| "Body#{n}" }
    sequence(:user_id) { |n| n }
    sequence(:question_id) { |n| n }
  end
end
