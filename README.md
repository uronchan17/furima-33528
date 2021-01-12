# テーブル設計

## users テーブル

| Column          | Type    | Option      |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birthday_year   | integer | null: false |
| birthday_month  | integer | null: false |
| birthday_date   | integer | null: false |

### Association

- has_many :product_listings
- has_many :product_purchases

## product_listings テーブル

| Column       | Type       | Option                       |
| ------------ | ---------- | ---------------------------- |
| image        |            | null: false                  |
| product_name | string     | null: false                  |
| explain      | string     | null: false                  |
| category     | string     | null: false                  |
| state        | string     | null: false                  |
| delivery_fee | string     | null: false                  |
| area         | string     | null: false                  |
| date         | string     | null: false                  |
| fee          | integer    | null: false                  |
| user         | references | null: false foreign_key: true|

### Association

- belongs_to :user
- has_one :product_purchase

## product_purchases テーブル
| Column          | Type       | Option                        |
| --------------- | ---------- | ----------------------------- |
| card_number     | integer    | null: false                   |
| cvc             | integer    | null: false                   |
| exp_month       | integer    | null: false                   |
| exp_year        | integer    | null: false                   |
| post            | string     | null: false                   |
| prefecture      | string     | null: false                   |
| municipality    | string     | null: false                   |
| address         | string     | null: false                   |
| building        | string     | null: true                    |
| phone_number    | integer    | null: false                   |
| user            | references | null: false foreign_key: true |
| product_listing | references | null: false foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product_listings