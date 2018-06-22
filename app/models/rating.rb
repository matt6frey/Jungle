class Rating < ActiveRecord::Base
  belongs_to :ratings

  validates :product_id, numericality: true
  validates :rating, numericality: true
end
