class ReviewsController < ApplicationController
  before_filter :is_logged_in?

  def is_logged_in?
    if !User.find(current_user.id)
      redirect_to :login
    end
  end

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

  def destroy
    user = User.find(current_user.id)
    @review = Review.find params[:id]
    if user.email === @review.email
      @review.destroy
      redirect_to :back, notice: 'Review deleted!'
    else
      redirect_to :back, notice: "Can't delete this review"
    end
  end

  private

  def review_params
    params.require(:reviews).permit(:product_id, :name, :email, :review, :rating)
  end
end
