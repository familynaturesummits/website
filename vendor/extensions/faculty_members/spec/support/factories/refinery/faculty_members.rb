
FactoryGirl.define do
  factory :faculty_member, :class => Refinery::FacultyMembers::FacultyMember do
    sequence(:first_name) { |n| "refinery#{n}" }
  end
end

