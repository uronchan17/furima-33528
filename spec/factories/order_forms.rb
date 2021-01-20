FactoryBot.define do
  factory :order_form do
    price { 3000 }
    token { 'tok_abcdefghijk00000000000000000' }
    post  { '063-0814' }
    address { '住所' }
    area_id { 1 }
    municipality { '札幌市' }
    building { '建物' }
    phone_number { '08095426650' }
  end
end
