FactoryBot.define do
  factory :comment do
    task
    comment { "Comment for test" }
    user
  end

  factory :invalid_comment, parent: :comment do |f|
    f.comment { nil }
  end
end
