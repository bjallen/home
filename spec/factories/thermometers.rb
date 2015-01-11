FactoryGirl.define do
  factory :thermometer do
    association :spark_core, :factory => :spark_core
    room "Guest Bedroom"
  end
end
