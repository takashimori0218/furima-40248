# テーブル設計

## Usersテーブル
|Column            |Type  |Options                 |
|------------------|------|------------------------|
|nickname          |string|null: false             |
|email             |string|null: false,unique: true|
|password          |string|null: false             |
|last_name         |string|null: false             |
|first_name        |string|null: false             |
|last_name_kana    |string|null: false             |
|first_name_kana   |string|null: false             |
|birthdate         |date  |null: false             |

### Association
- has_many :item
- has_many :order

## Itemsテーブル
|Column            |Type     |Options                      |
|------------------|---------|-----------------------------|
|title             |string   |null: false                  | 商品名カラム
|description       |text     |null: false                  | 商品の説明カラム
|category_id       |string   |null: false                  | カテゴリーカラム
|product_status_id |string   |null: false                  | 商品の状態カラム
|shopping_charge_id|string   |null: false                  | 配送料の負担カラム
|origin_region_id  |string   |null: false                  | 発送元の地域カラム
|days_to_ship_id   |string   |null: false                  | 発送までの日数カラム
|price             |integer  |null: false                  | 価格カラム
|user              |reference|null: false,foreign_key: true| ユーザーカラム

### Association
- has_one :order
- belongs_to :user

## Ordersテーブル
|Column            |Type     |Options                      |
|------------------|---------|-----------------------------|
|user              |reference|null: false,foreign_key: true|
|item              |reference|null: false,foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## Addressesテーブル
|Column            |Type   |Options                 |
|------------------|-------|------------------------|
|postal_code       |string |null: false             |
|genre_id          |integer|null: false             |
|origin_region     |string |null: false             |
|city              |string |null: false             |
|house_number      |string |null: false             |
|building_name     |string |null: true              |
|phone_number      |string |null: false             |

### Association
- belongs_to :order