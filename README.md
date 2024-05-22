# テーブル設計

## Usersテーブル
|Column             |Type  |Options                 |
|-------------------|------|------------------------|
|nickname           |string|null: false             |
|email              |string|null: false,unique: true|
|encrypted_password |string|null: false             |
|last_name          |string|null: false             |
|first_name         |string|null: false             |
|last_name_kana     |string|null: false             |
|first_name_kana    |string|null: false             |
|birthdate          |date  |null: false             |

### Association
- has_many :items
- has_many :orders

## Itemsテーブル
|Column            |Type      |Options                      |
|------------------|----------|-----------------------------|
|title             |string    |null: false                  | 商品名カラム
|description       |text      |null: false                  | 商品の説明カラム
|category_id       |integer   |null: false                  | カテゴリーカラム
|condition_id      |integer   |null: false                  | 商品の状態カラム
|shipping_fee_id   |integer   |null: false                  | 配送料の負担カラム
|prefecture_id     |integer   |null: false                  | 発送元の地域カラム
|shipping_time_id  |integer   |null: false                  | 発送までの日数カラム
|price             |integer   |null: false                  | 価格カラム
|user              |references|null: false,foreign_key: true| ユーザーカラム

### Association
- has_one :order
- belongs_to :user

## Ordersテーブル
|Column            |Type     |Options                      |
|------------------|---------|-----------------------------|
|user              |references|null: false,foreign_key: true|
|item              |references|null: false,foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## Addressesテーブル
|Column            |Type      |Options                        |
|------------------|----------|-------------------------------|
|postal_code       |string    |null: false                    |
|origin_region_id  |integer   |null: false                    |
|city              |string    |null: false                    |
|house_number      |string    |null: false                    |
|building_name     |string    |                               |
|phone_number      |string    |null: false                    |
|order             |references|null: false,foreign_key: true|

### Association
- belongs_to :order