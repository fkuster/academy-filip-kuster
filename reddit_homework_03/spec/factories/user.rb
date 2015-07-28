FactoryGirl.define do
  factory :user do
    nickname 'fkuster'
    password 'fkuster123'
    sequence(:email){|n| "user#{n}@email.com"}
  end
end
