FactoryBot.define do
  factory :project do
    name {"Project for test"}
    details {"Just for testing"}
    status {1}
    user
  end

  factory :invalid_project, parent: :project do |f|
    f.name { nil }
  end
end
