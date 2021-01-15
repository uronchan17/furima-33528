class ProductListing < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :days_to_ship
  with_options presence: true do
    validates :product_name
    validates :explain
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :delivery_fee_id
      validates :days_to_ship_id
    end
    validates :area_id, numericality: { only_integer: true }
    validates :fee, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' }
    validates :image
  end
end
