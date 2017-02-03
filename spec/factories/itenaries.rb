FactoryGirl.define do
  factory :itenary do
    title "My Itenary"
    user 

    factory :itenary_with_items do
     
      transient do
        items_count 5
      end

      
      after(:create) do |itenary, evaluator|
        create_list(:item, evaluator.items_count, itenary: itenary)
      end
    end
  end

  
end
