FactoryBot.define do
  factory :user do
    first_name { "Astm" }
    last_name { "tasks" }
    sequence(:email) { |n| "test#{n}@tasks.com" }
    password { "123456789" }
    password_confirmation { "123456789" }
    admin {false}
  end

  factory :invalid_user, parent: :user do |f|
    f.first_name { nil }
  end
end
