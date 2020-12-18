FactoryBot.define do
  factory :user do
    name {"enduser"}
      sequence(:email) { |n| "enduser#{n}@end.com"}
      password { "enduser"}
  end
end
