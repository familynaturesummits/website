
FactoryGirl.define do
  factory :ba_button, :class => Refinery::BaButtons::BaButton do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

