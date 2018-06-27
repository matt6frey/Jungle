class Product < ActiveRecord::Base
  has_many :reviews

  monetize :price_cents
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price_cents, numericality: {:greater_than => 0}
  validates :quantity, presence: true
  validates :category, presence: true

end
