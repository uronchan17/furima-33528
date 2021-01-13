FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.intials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"111aaa"}
    password_confirmation {password}
    last_name             {"あ亞ア"}
    first_name            {"ア亞あ"}
    last_name_kana        {"アイウ"}
    first_name_kana       {"ウイア"}
    birthday              {1935-03-02}
  end
end