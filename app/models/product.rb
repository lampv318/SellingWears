class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :order_lines, dependent: :destroy
  has_many :rates, dependent: :destroy
end
