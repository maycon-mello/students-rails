FactoryGirl.define do
  factory :course, class: Course do
    name 'name'
    description 'description'
    status StudentStatus::ACTIVE
  end
end
