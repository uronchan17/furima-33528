class CreateProductListings < ActiveRecord::Migration[6.0]
  def change
    create_table :product_listings do |t|

      t.timestamps
    end
  end
end
