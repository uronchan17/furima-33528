class Order < ApplicationRecord
  belongs_to :product_purchase_user


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
end
