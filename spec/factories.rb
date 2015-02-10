FactoryGirl.define do
  
  factory :user do
    name "Bob User"
    sequence(:email) { |n| "user#{n}@example.com" }
    password "secret99"
    role :director
    # derived factories
    factory(:admin)             { role :admin }
    factory(:regional_director)     { role :regional_director }
    factory(:director)          { role :director }
    factory(:customer)          { role :customer; hospital }
  end

  factory :hospital do
    name "General Hospital"
    category
    data_entry_start Date.today
    contract_start Date.today
  end
  
  factory :category do
    name "Test Category"
  end
end