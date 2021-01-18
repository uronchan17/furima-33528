class ProductPurchaseUser < ApplicationRecord
  belongs_to :product_listing
  belongs_to :user
  has_one    :order
end
