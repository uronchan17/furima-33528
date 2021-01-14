class CreateProductListings < ActiveRecord::Migration[6.0]
  def change
    create_table :product_listings do |t|
      t.string     :product_name
      t.text       :explain
      t.integer    :category_id
      t.integer    :state_id
      t.integer    :delivery_fee_id
      t.integer    :area_id
      t.integer    :date_id
      t.integer    :delivery_fee_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
