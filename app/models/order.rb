class Order < ApplicationRecord
  belongs_to :user
  # belongs_to :state_order
  has_many :order_lines, dependent: :destroy

  before_create :set_state_order
  before_save :update_subtotal
  before_save :update_total
  before_save :update_tax

  def tax 
    subtotal * 0.1
  end

  def subtotal
    order_lines.collect { |oi| oi.valid? ? (oi.number * oi.unit_price) : 0 }.sum
  end

  private

  def set_state_order
    self.state_order_id = 1
  end

  def update_subtotal
    self.subtotal = subtotal
  end

  def update_total
    self.total = subtotal + tax
  end

  def update_tax
    self.tax = tax
  end
end
