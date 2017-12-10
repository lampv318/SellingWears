class OrderLine < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :number, presence: true, 
    numericality: {only_integer: true, greater_than: 0}
  validate :order_present
  validate :book_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:price]
    else
      book.price
    end
  end

  def total_price
    unit_price * number
  end

  private

  def book_present
    if book.nil?
      errors.add(:book, t "order_lines.not_valid_book")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, t "order_lines.not_valid_order")
    end
  end

  def finalize
    self[:price] = unit_price
    self[:total_price] = number * self[:price]
  end
end
