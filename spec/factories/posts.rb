# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "My Post Title"
    content "My Post Text"

	  factory :hot_post do 
	  	title "Hooot"
	  end
  end
end
