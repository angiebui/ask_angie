FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user_#{n}" }
    password "password"
    password_confirmation "password"
    sequence(:email) { |e| "email#{e}@gmail.com"}
    sequence(:gender) { |n| n % 2 ? "Male" : "Female" }
  end
end
