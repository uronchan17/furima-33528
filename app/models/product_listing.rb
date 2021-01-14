class ProductListing < ApplicationRecord
  belongs_to :user
  has_one_attached :image
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
  with_options presence: true, numericality: { :greater_than_or_equel_to => 300, :less_than_or_equel_to => 9999999 }, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } do
    validates :fee
  end
  validates :image, presence: true
end
