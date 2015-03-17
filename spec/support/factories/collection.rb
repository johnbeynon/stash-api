FactoryGirl.define do
  factory :collection do
    sequence :name do |n|
      "Test Collection #{n}"
    end
  end
end
