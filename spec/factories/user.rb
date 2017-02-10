FactoryGirl.define do
  factory :user do
  	first_name "Joe"
  	last_name "Blogs"
  	organisation "My Big Company"
  	sequence(:email) { |n| "foo#{n}@example.com"}
  	password "secret123"
  end
end