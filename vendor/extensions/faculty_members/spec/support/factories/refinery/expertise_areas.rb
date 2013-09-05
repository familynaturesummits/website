
FactoryGirl.define do
  factory :expertise_area, :class => Refinery::FacultyMembers::ExpertiseArea do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

