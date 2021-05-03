FactoryBot.define do
  factory :photo do
    name { '洋服' }
    explanation { 'おさがりで貰ったものです' }
    condition_id { 2 }
    burden_id { 2 }
    area_id { 2 }
    shipping_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |photo|
      photo.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    
  end
end
