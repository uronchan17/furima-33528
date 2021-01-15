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
  with_options :numericality: { other_than: 1 }, presence:true do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :days_to_ship_id
  end
  validates :area_id, numericality: { only_integer: true }, presence: true
  with_options presence: true, inclusion: {in: 300..9999999}, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } do
    validates :fee
  end
  validates :image, presence: true
end
