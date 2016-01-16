FactoryGirl.define do
  factory :line do
    sequence(:name) { |n| n.to_s }
  end
end
