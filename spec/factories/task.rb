FactoryGirl.define do
  factory :task do
  	name "Test Task"
  	description "This is a desc"
  	category_id 1
  	regularity_id 1
  end
end