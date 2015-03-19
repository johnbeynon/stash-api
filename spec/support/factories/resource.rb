FactoryGirl.define do
  factory :resource do
    type 'Link'
    collection_id { SecureRandom.uuid }
    sequence :name do |n|
      "Test Resource #{n}"
    end
  end
end
