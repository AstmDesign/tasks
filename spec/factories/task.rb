FactoryBot.define do
  factory :task do
    title   { "test title" }
    details { "test details" }
    deadline { "2019-05-31 22:00:00" }
    priority { "1" }
    status { "1" }
    user
    project
  end

  factory :invalid_task, parent: :task do |f|
    f.title { nil }
    f.deadline { nil }
  end
end
