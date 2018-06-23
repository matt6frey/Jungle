class Review < ActiveRecord::Base
  belongs_to :product

  validates :product_id, :rating, numericality: true
  validates  :name, :email, :review, presence: true
end
