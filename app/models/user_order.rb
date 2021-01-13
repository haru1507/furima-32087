class UserOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :addresses
    validates :phone_number, length: { maximum: 11 }
  end

  def save
    user = User.create(first_name: first_name, last_name: last_name, first_name_kana: first_name_kana, last_name_kana: last_name_kana, nickname: nickname, birth_date: birth_date)
    item = Item.create(name: name, info: info, price: price, image: image, category_id: category_id, sales_status_id: sales_status_id, shipping_fee_status_id: shipping_fee_status_id, prefecture_id: prefecture_id, scheduled_delivery_id: scheduled_delivery_id)
    Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number)
  end

end