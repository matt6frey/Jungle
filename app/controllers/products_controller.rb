class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    @allReviews = []
    @products.each { |product|
      ratings = Rating.where(product_id: product.id)
      @allReviews.push({id: product.id, rating: overall(ratings)})
    }
  end

  def show
    @product = Product.find params[:id]
    @allReviews = Review.where(product_id: params[:id])
  end

end
