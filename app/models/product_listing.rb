class ProductListing < ApplicationRecord
  belings_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :days_to_ship
end
