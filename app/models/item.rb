class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category_id
  belongs_to :sales_status_id
  belongs_to :shipping_fee_status_id
  belongs_to :prefecture_id
  belongs_to :scheduled_delivary_id

  with_options presence: true do
    validates :name
    validates :info
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivary_id
  end

end
