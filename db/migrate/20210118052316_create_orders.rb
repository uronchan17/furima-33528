class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string     :post
      t.integer    :area_id
      t.string     :municipality
      t.string     :address
      t.string     :building
      t.string     :phone_number
      t.references :product_purchase_user, foreign_key: true
      t.timestamps
    end
  end
end
