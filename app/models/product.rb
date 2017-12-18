class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :order_lines, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :users, through: :relationships
  has_many :relationships
  belongs_to :category

  mount_uploader :picture, PictureUploader

  validates :name, presence: true, length: { maximum: 50 }
  validates :price, presence: true
  validates :category_id, presence: true
  validate  :picture_size

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add :picture, "errors"
    end
  end
end
