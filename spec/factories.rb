FactoryGirl.define do

  factory :user do
    
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.safe_email }
    birth_date { 18.years.ago - Faker::Number.number(3).to_i.days }
    gender "male"
    password "foobar"
    password_confirmation "foobar"
  end
  
  factory :bank do
    
    name { Faker::Company.name }
    short_name "MEB"
    website "foobar.com"
    
    factory :bank_with_users do
      
      transient do
        users_count 1
      end
      
      after(:create) do |bank, evaluator|
        bank.users << create_list(:user, evaluator.users_count)
        bank.save
      end
    end
  end
end