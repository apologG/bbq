FactoryBot.define do
  factory :event do
    sequence(:title){ |n| "Event_#{n}" }
    pincode { '1234' }
    address { 'San-Francisco' }
    datetime { Time.now }
 
    association :user
  end
end