FactoryGirl.define do
  sequence :tag_name do |n|
    "Tag #{n}"
  end
  factory :tag do
    name { generate :tag_name }
    collection_id { SecureRandom.uuid }
  end
end
