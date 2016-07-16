FactoryGirl.define do
  factory :student, class: Student do
    name 'name'
    sequence(:register_number) { |n| n }
    status StudentStatus::ACTIVE
  end
end
