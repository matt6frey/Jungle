class ReviewsController < ApplicationController
  def index
    @reviews = Review.all.order(created_at: :desc)
  end

  def show
    @reviews = Review.find params(:id)
  end

  def create
    review = User.new(user_params)
    if review.save
      redirect_to (review)
    else
      redirect_to (review)
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :email, :review)
  end
end
