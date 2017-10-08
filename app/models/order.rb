class Order < ApplicationRecord
  belongs_to :user
  has_many :product_lists

#  validates_presence_of :billing_name, :billing_address, :shipping_name, :shipping_address

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true

end
