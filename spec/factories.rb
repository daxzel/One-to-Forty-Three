FactoryGirl.define  do 

  factory :car do |item|
    item.sequence(:title){ |n| "Title #{n}" }
    item.sequence(:wiki){ |n| "Wiki #{n}" }
    item.association :user, :factory =>:user 
  end

  factory :user do |u|
    u.sequence(:email){ |n| "user#{n}@example.net" }
    u.password "123456"
    u.password_confirmation "123456"
    u.association :car, :factory => :car
  end

  factory :photo do |p|
    p.photo { File.open(File.join(Rails.root, "/public/images/rails.png")) } 
    p.association :user, :factory => :user
    p.association :car, :factory => :car
  end

end
