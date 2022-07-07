FactoryBot.define do
  factory :friend do
    account
    first_name {"Friend Frist Name"}
    last_name {"Friend Last Name"}
    facebook {true}
    
  end
end
