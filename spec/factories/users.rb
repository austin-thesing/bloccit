include RandomData # never forget to include your modules if you call them in a new file otherwise you will get undefined errors

FactoryGirl.define do
  pw = RandomData.random_sentence
  factory :user do
    name RandomData.random_sentence
    sequence(:email){|n| "user#{n}@factory.com"}
    password pw
    password_confirmation pw
    role :member
  end
end
