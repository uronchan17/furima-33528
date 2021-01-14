class ProductListing < ApplicationRecord
  belings_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :days_to_ship

  validates :product_name, presence: true
  validates :explain, presence: true
  validates :category_id, numericality: { other_than: 1 }, presence:true
  validates :state_id, numericality: { other_than: 1 }, presence: true
  validates :delivery_fee_id, numericality: { other_than: 1 }, presence: true
  validates :area_id, numericality: { other_than: 1 }, presence: true
  validates :days_to_ship_id, numericality: { other_than: 1 }, presence: true
  validates :fee, presence: true
end
