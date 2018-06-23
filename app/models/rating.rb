class Rating < ActiveRecord::Base
  belongs_to :product

  validates :product_id, numericality: true
  validates :rating, numericality: true
end
