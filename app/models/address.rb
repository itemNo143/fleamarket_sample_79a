class Address < ApplicationRecord

  belongs_to :user

  with_options presence: true do |admin|
    admin.validates :destination_name
    admin.validates :destination_name_hurigana
    admin.validates :post_code, format: { with: /\A\d{3}[-]\d{4}$|^\d{7}\z/, message: "フォーマットが不適切です" }
    admin.validates :prefecture_id
    admin.validates :city
    admin.validates :address
  end
  validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: "フォーマットが不適切です" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  delegate :name, to: :prefecture

end
