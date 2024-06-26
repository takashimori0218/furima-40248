class OrderForm
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id, :price
  
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'must be in the format XXX-XXXX' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'must be 10 or 11 digits' }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    return false unless valid?
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create!(
      order_id: order.id,
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building: building,
      phone_number: phone_number
    )

    true
  rescue ActiveRecord::RecordInvalid
    false
  end
end