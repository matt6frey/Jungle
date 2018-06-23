class Review < ActiveRecord::Base
  belongs_to :product

  validates :product_id, numericality: true
  validates  :name, :email, :review, presence: true
end
