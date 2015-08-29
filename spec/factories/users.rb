FactoryGirl.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.user_name { Faker::Internet.user_name }
    f.password { Faker::Internet.password }
    f.password_confirmation { Faker::Internet.password }
  end

end
