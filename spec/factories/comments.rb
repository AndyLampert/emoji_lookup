FactoryGirl.define do

  factory :comment do
    title { Faker::App.name }
    body { Faker::Lorem.paragraph(2) }
    user
  end

end
