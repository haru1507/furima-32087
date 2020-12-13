# テーブル設計

## usersテーブル

| Column                | Type   | Options  |
| --------------------- | ------ | -------- |
| last-name             | string | NOT NULL |
| first-name            | string | NOT NULL |
| last-name-kan         | string | NOT NULL |
| first-name-kana       | string | NOT NULL |
| nickname              | string | NOT NULL |
| email                 | string | NOT NULL |
| password              | string | NOT NULL |
| password-confirmation | string | NOT NULL |
| birth-date            | string | NOT NULL |

### Association

- has_many :items
- has_many :comments
- has_one :order

## itemsテーブル

| Column                   | Type       | Options  |
| ------------------------ | ---------- | -------- |
| item-image               | string     | NOT NULL |
| item-name                | string     | NOT NULL |
| item-info                | string     | NOT NULL |
| item-category            | string     | NOT NULL |
| item-sales-status        | string     | NOT NULL |
| item-shipping-fee-status | integer    | NOT NULL |
| item-prefecture          | string     | NOT NULL |
| item-scheduled-delivery  | integer    | NOT NULL |
| item-price               | integer    | NOT NULL |
| user                     | references |          |

### Association

- belongs_to :user
- has_many :comments
- has_one :order

## commentsテーブル

| Column       | Type       | Options  |
| ------------ | ---------- | -------- |
| comment-text | text       | NOT NULL |
| user         | references |          |
| item         | references |          |

### Association

- belongs_to :user
- belongs_to :item

## ordersテーブル

| Column         | Type       | Options  |
| -------------- | ---------- | -------- |
| card-number    | integer    | NOT NULL |
| card-exp-month | integer    | NOT NULL |
| card-exp-year  | integer    | NOT NULL |
| card-cvc       | integer    | NOT NULL |
| postal-code    | integer    | NOT NULL |
| prefecture     | string     | NOT NULL |
| city           | string     | NOT NULL |
| addresses      | string     | NOT NULL |
| building       | string     |          |
| phone-number   | integer    | NOT NULL |
| user           | references |          |
| item           | references |          |

### Association

- belongs_to :user
- belongs_to :item