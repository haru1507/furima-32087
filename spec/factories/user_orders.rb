FactoryBot.define do
  factory :user_order do
    postal_code   { '123-4567' }
    prefecture_id { 2 }
    city          { '北見市' }
    addresses     { '青山1-1-1' }
    phone_number  { '09012345678' }
    token         { 'tok_abcdefghijk0123456789' }
    user_id       { 1 }
    item_id       { 1 }
  end
end
