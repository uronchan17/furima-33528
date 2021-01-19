class OrderForm
  include ActiveModel::Model
  attr_accessor :post, :area_id, :municipality, :building, :phone_number, :address, :user_id, :product_listing_id, :token, :price
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  with_options presence: true do
    validates :post, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :area_id, numericality: { only_integer: true }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: VALID_PHONE_REGEX }
    validates :token
  end

  def save
    Payjp.api_key = "sk_test_653263e0478df5ce701bc2e1"
    Payjp::Charge.create(
      amount: price,
      card: token,
      currency: 'jpy'
    )
    product = ProductPurchaseUser.create!(product_listing_id: product_listing_id, user_id: user_id)
    Order.create(post: post, area_id: area_id, municipality: municipality, building: building, phone_number: phone_number, address: address, product_purchase_user_id: product.id)
  end
end