FactoryBot.define do
  factory :user do
    last_name             { '佐藤' }
    first_name            { '太郎' }
    last_name_kana        { 'サトウ' }
    first_name_kana       { 'タロウ' }
    nickname              { Faker::Internet.name }
    email                 { Faker::Internet.free_email }
    password              { 'a1der5' }
    password_confirmation { password }
    birth_date            { '2000-01-01' }
  end
end
