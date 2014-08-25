FactoryGirl.define do
  factory :user do
    email 'a@a.fr'
    password '123456789'
    password_confirmation '123456789'

    factory :alex do
      username 'a@a.fr'
    end
  end
end