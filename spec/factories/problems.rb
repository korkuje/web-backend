FactoryGirl.define do
  factory :problem, class: Problem do
    reason 1
    lat 51.7592485
    lng 19.4559833
    trait :with_line do
      association :line, factory: :line
    end
    trait :with_user do
      association :user, factory: :user
    end

    factory :problem_with_line_and_user, traits: [:with_line, :with_user]
  end
end
