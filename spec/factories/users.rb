FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '111aaa' }
    password_confirmation { password }
    last_name             { 'あ亞ア' }
    first_name            { 'ア亞あ' }
    last_name_kana        { 'アイウ' }
    first_name_kana       { 'ウイア' }
    birthday              { Faker::Date.between(from: '1990-09-23', to: '2014-09-25') }
  end
end
