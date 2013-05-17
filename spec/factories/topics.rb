FactoryGirl.define do
  factory :topic do
    sequence(:title) { |n| "Title#{n}" }
  end
end
