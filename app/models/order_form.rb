class OrderForm
  include ActiveModel::Model
  attr_accessor :token, :price, :user_id, :product_id, :shipping_address, :billing_address, :postal_code, :prefecture, :city, :address, :building, :phone_number

    # ここにバリデーションの処理を書く
    validates :token, :price, :user_id, :product_id, :postal_code, :prefecture, :city, :address, :phone_number, presence: true
    validates :price, numericality: { greater_than: 0 }
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "must be in the format XXX-XXXX" }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "must be 10 or 11 digits" }

  def save
    return false unless valid?

    ActiveRecord::Base.transaction do
      order = Order.create!(
        price: price,
        user_id: user_id,
        product_id: product_id
      )
      Address.create!(
        price_id: price.id,
        postal_code: postal_code,
        prefecture: prefecture,
        city: city,
        address: address,
        building: building,
        phone_number: phone_number
      )
    end

    true
  rescue ActiveRecord::RecordInvalid
    false
  end
end
