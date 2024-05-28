class Address < ApplicationRecord
  belongs_to :order

  validates :postal_code, :prefecture_id, :city, :address, :phone_number, presence: true
end
