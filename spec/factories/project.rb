FactoryBot.define do
  factory :project do
    name { "Project for test" }
    details { "Just for testing" }
    status { "in_progress" }
    user
  end

  factory :invalid_project, parent: :project do |f|
    f.name { nil }
    f.status { nil }
  end
end
