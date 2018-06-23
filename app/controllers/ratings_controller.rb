class RatingsController < ApplicationController
  def index
    create
  end

  def show
    @ratings = Rating.find params(:id)
  end

  def create
    puts params.inspect
    rating = Rating.new(rating_params)
    if rating.save
      redirect_to :back
    else
      redirect_to :back, notice: "Error when trying to save your Rating"
    end
  end

  private

  def rating_params
    params.require(:ratings).permit(:product_id, :rating)
  end
end
