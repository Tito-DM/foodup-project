FactoryBot.define do
  factory :user do
    name { 'John' }
    email { "#{name}@example.com" }
    password { 'password' }
    phone { '0123456789' }
  end
end