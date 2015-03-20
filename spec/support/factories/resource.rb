FactoryGirl.define do
  sequence :resource_name do |n|
    "Test Resource #{n}"
  end
  factory :resource do
    title { generate :resource_name }
    type Resource.types.first
    collection_id { SecureRandom.uuid }
  end
end
