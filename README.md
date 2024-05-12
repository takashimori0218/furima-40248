ユーザー管理機能 (users)
---------------------
- user_id (PK)
- nickname
- email
- password
- encrypted_password
- last_name
- first_name
- birthdate

商品出品機能 (lists)
---------------------
- list_id (PK)
- user_id (FK)
- title
- description
- details
  - category
  - status
- shipping_details
  - charge
  - Region
  - date
- price

商品購入機能 (orders)
---------------------
- order_id (PK)
- list_id (FK)
- user_id (FK)
- credit_card_number
- expiration_date
- security_code
- address
- postal_code
- prefecture
- city
- street_address
- building_name
- phone_number
