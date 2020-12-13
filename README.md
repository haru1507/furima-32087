# テーブル設計

## usersテーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| last_name          | string   | null: false |
| first_name         | string   | null: false |
| last_name_kan      | string   | null: false |
| first_name_kana    | string   | null: false |
| nickname           | string   | null: false |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| birth-date         | datetime | null: false |

### Association

- has_many :items
- has_many :orders
- has_many :addresses

## itemsテーブル

| Column                   | Type       | Options           |
| ------------------------ | ---------- | ----------------- |
| item_image               | string     | null: false       |
| item_name                | string     | null: false       |
| item_info                | string     | null: false       |
| item_category            | string     | null: false       |
| item_sales_status        | string     | null: false       |
| item_shipping_fee_status | integer    | null: false       |
| item_prefecture          | string     | null: false       |
| item_scheduled_delivery  | integer    | null: false       |
| item_price               | integer    | null: false       |
| user                     | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_one :address

## ordersテーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| card_number    | integer    | null: false       |
| card_exp-month | integer    | null: false       |
| card_exp-year  | integer    | null: false       |
| card_cvc       | integer    | null: false       |
| user           | references | foreign_key: true |
| item           | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## addressesテーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ------------------|
| postal_code     | string     | null: false       |
| prefecture      | string     | null: false       |
| city            | string     | null: false       |
| addresses       | string     | null: false       |
| building        | string     |                   |
| phone_number    | string     | null: false       |
| user            | references | foreign_key: true |
| item            | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
