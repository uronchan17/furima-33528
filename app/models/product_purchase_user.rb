class ProductPurchaseUser < ApplicationRecord
  belongs_to :user
  belongs_to :product_listing
  has_one    :order
end
