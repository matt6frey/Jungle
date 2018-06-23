class ReviewsController < ApplicationController
  def index
    @reviews = Review.all.order(created_at: :desc)
  end

  def show
    @reviews = Review.find params(:id)
  end

  def create
    review = Review.new(review_params)
    if review.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  private

  def review_params
    params.require(:reviews).permit(:product_id, :name, :email, :review, :rating)
  end
end
