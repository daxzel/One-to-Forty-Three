FactoryGirl.define  do 

  factory :car do |item|
    item.sequence(:title){ |n| "Title #{n}" }
    item.sequence(:wiki){ |n| "Wiki #{n}" }
  end
end
