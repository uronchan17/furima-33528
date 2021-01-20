class AddProductPurchaseUserToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :product_purchase_user, null: false, foreign_key: true
  end
end
