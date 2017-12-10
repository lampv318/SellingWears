class Order < ApplicationRecord
  belongs_to :user
  belongs_to :order_status

  has_many :order_lines, dependent: :destroy

  before_create :set_order_status
  before_save :update_subtotal
  before_save :update_subtotal
  before_save :update_subtotal
  before_save :update_tax

  def tax
    subtotal * 0.1
  end

  def subtotal
    order_lines.collect {|oi| oi.valid? ? (oi.number * oi.unit_price) : 0}.sum
  end

  private

  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self.subtotal = subtotal
  end

  def update_tax
    self.tax = tax
  end

end
