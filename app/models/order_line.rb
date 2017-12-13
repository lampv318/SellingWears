class OrderLine < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :number, presence: true, 
    numericality: {only_integer: true, greater_than: 0}
  validate :order_present
  validate :product_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:price]
    else
      product.price
    end
  end

  def total_price
    unit_price * number
  end

  private

  def product_present
    if product.nil?
      errors.add(:product,  "Not Valid Product")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "Not Valid Order")
    end
  end

  def finalize
    self[:price] = unit_price
    self[:total_price] = number * self[:price]
  end
end
