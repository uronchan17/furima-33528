FactoryBot.define do
  factory :product_listing do
    image           {Faker::Lorem.sentence}
    product_name    {Faker::Lorem.sentence}
    explain         {Faker::Lorem.sentence}
    category_id     { 2 }
    state_id        { 2 }
    delivery_fee_id { 2 }
    area_id         { 2 }
    days_to_ship_id { 2 }
    fee             { 500 }
    association :user
  end
end

