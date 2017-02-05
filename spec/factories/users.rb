FactoryGirl.define do

  sequence :email do |n|
		"test#{n}@test.com"
  end
  sequence :username do |n|
    "muyaszed#{n}"
  end

  factory :user do
  	username {generate :username}
  	email {generate :email}
    password 'abcdef'
    password_confirmation 'abcdef'

    
    factory :user_with_itenaries do
     
      transient do
        itenaries_count 5
      end

      
      after(:create) do |user, evaluator|
        create_list(:itenary, evaluator.itenaries_count, user: user)
      end
    end



    
  end

  factory :second_user, class: "User" do
    username {generate :username}
    email {generate :email}
    password 'abcdef'
    password_confirmation 'abcdef'

    
    factory :second_user_with_itenaries do
     
      transient do
        itenaries_count 5
      end

      
      after(:create) do |user, evaluator|
        create_list(:itenary, evaluator.itenaries_count, user: user)
      end
    end



    
  end
end
