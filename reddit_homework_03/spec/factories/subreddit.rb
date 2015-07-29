FactoryGirl.define do
  factory :subreddit do
    sequence(:name){|n| "username#{n}"}
    description 'All about fishing!'
  end
end
