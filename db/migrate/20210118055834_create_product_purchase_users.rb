class CreateProductPurchaseUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :product_purchase_users do |t|
      t.references      :user, foreign_key: true
      t.references      :prpduct_listibg, foreign_key: true

      t.timestamps
    end
  end
end
