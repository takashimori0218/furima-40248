# テーブル設計

## Usersテーブル
|Column            |Type  |Options                 |
|------------------|------|------------------------|
|nickname          |string|null: false             |
|email             |string|null: false,unique: true|
|password          |string|null: false             |
|last_name         |string|null: false,VARCHAR(100)|
|first_name        |string|null: false,VARCHAR(100)|
|birthdate         |string|null: false             |

### Association
- has_many :item
- has_many :order
- belongs_to :address

## Itemsテーブル
|Column               |Type  |Options                 |
|---------------------|------|------------------------|
|title                |text  |null: false             |
|description          |text  |null: false             |
|detail_id            |string|null: false             |
|region_id            |string|null: false             |
|date                 |string|null: false             |
|price                |string|null: false             |

### Association
- belongs_to :order
- belongs_to :user
- belongs_to :address

## Ordersテーブル
|Column            |Type  |Options                 |
|------------------|------|------------------------|
|user_id           |string|null: false             |

### Association
- belongs_to :item
- belongs_to :user
- belongs_to :address

## Addressesテーブル
|Column            |Type  |Options                 |
|------------------|------|------------------------|
|address           |string|null: false             |
|postal_code       |string|null: false             |
|prefecture        |string|null: false             |
|city              |string|null: false             |
|street_address    |string|null: true              |
|building_name     |string|null: false             |
|phone_number      |string|null: false             |

### Association
- has_many :users
- belongs_to:item
- belongs_to :order