FactoryGirl.define do
  factory :resource do
    type 'Link'
    sequence :name do |n|
      "Test Resource #{n}"
    end
  end
end
