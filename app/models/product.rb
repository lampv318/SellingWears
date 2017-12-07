class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :order_lines, dependent: :destroy
  has_many :rates, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :price, presence: true
  validates :category, presence: true, length: { maximum: 20 }
  validates :code, presence: true, uniqueness: true
end
