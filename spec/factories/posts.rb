FactoryGirl.define do
  factory :post do
    entry { Faker::Company.catch_phrase }

    trait :with_comments do
      after :create do |post|
        FactoryGirl.create_list :comment, 5, :post => post
      end
    end

    user
  end
end

# usage:
# FactoryGirl.create :post, :with_comments
