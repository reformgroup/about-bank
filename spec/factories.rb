FactoryGirl.define do  factory :bank_user do
    bank nil
user nil
  end

  factory :user do
    first_name "Ivan"
    last_name "Ivanov"
    email "ivan.ivanov@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
  
  factory :bank do
    full_name "My Example Bank"
    short_name "MEB"
    site "www.myexamplebank.com"
  end
end