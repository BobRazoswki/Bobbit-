FactoryGirl.define do
  factory :user do
    email 'bob@github.com'
    password '12345678'
    password_confirmation '12345678'

    factory :alex do
      username 'a@a.com'
    end
  end
end